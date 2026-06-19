#!/usr/bin/with-contenv bashio

# Read configuration from Home Assistant
export SIGNAL_API_URL=$(bashio::config 'signal_api_url')
export SIGNAL_ACCOUNT=$(bashio::config 'signal_account')
export SERVER_ADDR=$(bashio::config 'server_address')
export REPEAT_LAST_MESSAGE=$(bashio::config 'repeat_last_message')
export RECORD_MESSAGE_TYPE=$(bashio::config 'record_message_type')
export LOG_LEVEL=$(bashio::config 'log_level')

bashio::log.info "Starting Signal API Receiver..."
bashio::log.info "Signal API URL: ${SIGNAL_API_URL}"
bashio::log.info "Signal Account: ${SIGNAL_ACCOUNT}"

# Run the application
exec /app/signal-api-receiver serve
