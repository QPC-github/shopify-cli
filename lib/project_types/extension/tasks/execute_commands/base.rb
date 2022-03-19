# frozen_string_literal: true
require "shopify_cli"

module Extension
  module Tasks
    module ExecuteCommands
      class Base
        include SmartProperties

        property! :type, accepts: Models::DevelopmentServerRequirements::SUPPORTED_EXTENSION_TYPES
        property! :context, accepts: ShopifyCLI::Context

        def self.inherited(subclass)
          super
          subclass.prepend(OutdatedExtensionDetection)
        end
      end
    end
  end
end
