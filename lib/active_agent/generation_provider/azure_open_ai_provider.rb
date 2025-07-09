require "openai"
require "active_agent/action_prompt/action"
require_relative "open_ai_provider"

module ActiveAgent
  module GenerationProvider
    class AzureOpenAIProvider < OpenAIProvider
      def initialize(config)
        super
        @api_version = config["api_version"] || "2024-10-21"

        @client = OpenAI::Client.new(
          uri_base: @host,
          access_token: @api_key,
          api_type: :azure,
          api_version: @api_version
        )
      end
    end
  end
end
