# Use the official Confluent Kafka image
FROM confluentinc/cp-kafka:latest

# Expose necessary ports
EXPOSE 9092 2181

# Add any additional configuration or setup here if needed

# Set environment variables for Kafka broker
ENV KAFKA_BROKER_ID=1
ENV KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181
ENV KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=PLAINTEXT:PLAINTEXT
ENV KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092
ENV KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1

# Start Kafka server
CMD ["bash", "-c", "bin/zookeeper-server-start.sh config/zookeeper.properties & bin/kafka-server-start.sh config/server.properties"]
