CREATE KEYSPACE users WITH replication = {'class': 'NetworkTopologyStrategy', 'dal05': '1'}  AND durable_writes = true;
-- CREATE KEYSPACE users WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : '1'}  AND durable_writes = true;

CREATE TABLE users.rvp (
    aid text,
    device_type text,
    device_id text,
    timekey bigint,
    timestamp bigint,
    product_id text,
    PRIMARY KEY ((aid, device_type, device_id, timekey), timestamp, product_id)
) WITH CLUSTERING ORDER BY (timestamp DESC, product_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99PERCENTILE';

CREATE TABLE users.other_id_lookup (
    device_type text,
    device_id text,
    other_device_type text,
    other_device_id text,
    confidence_score int,
    PRIMARY KEY ((device_type, device_id), other_device_type, other_device_id)
) WITH CLUSTERING ORDER BY (other_device_type ASC, other_device_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99PERCENTILE';