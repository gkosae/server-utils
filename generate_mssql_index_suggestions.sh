#!/bin/bash

# === Configuration ===
SERVER="your_sql_server_host_or_ip"
USER="your_sql_username"
PASSWORD="your_sql_password"
DATABASE="your_database_name"
OUTPUT_FILE="index_suggestions.sql"

# === SQL Query to get index suggestions ===
SQL_QUERY="
SET NOCOUNT ON;
SELECT
    'CREATE NONCLUSTERED INDEX IDX_' +
    REPLACE(REPLACE(REPLACE(ISNULL(mid.statement, 'UnknownTable'), '[', ''), ']', ''), '.', '_') +
    '_' + CAST(mid.index_handle AS VARCHAR) + '
ON ' + mid.statement + '
(' + ISNULL(mid.equality_columns, '') +
    CASE WHEN mid.equality_columns IS NOT NULL AND mid.inequality_columns IS NOT NULL THEN ',' ELSE '' END +
    ISNULL(mid.inequality_columns, '') + ')
' +
    ISNULL('INCLUDE (' + mid.included_columns + ')', '') + ';' AS create_index_statement,
    migs.user_seeks,
    migs.user_scans,
    migs.avg_user_impact,
    migs.avg_total_user_cost
FROM
    sys.dm_db_missing_index_group_stats AS migs
JOIN
    sys.dm_db_missing_index_groups AS mig ON migs.group_handle = mig.index_group_handle
JOIN
    sys.dm_db_missing_index_details AS mid ON mig.index_handle = mid.index_handle
ORDER BY
    migs.avg_total_user_cost * migs.avg_user_impact * (migs.user_seeks + migs.user_scans) DESC;
"

# === Run query and write to file ===
echo "Generating index suggestions for $DATABASE..."

sqlcmd -S "$SERVER" -U "$USER" -P "$PASSWORD" -d "$DATABASE" -h -1 -W -s"" -Q "$SQL_QUERY" > "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
    echo "✅ Index suggestions saved to $OUTPUT_FILE"
else
    echo "❌ Failed to generate index suggestions"
    exit 1
fi
