module FHIR
  module Sections
    module Search
      
      #
      # Search a set of resources of a given type.
      # 
      # @param klass The type of resource to be searched.
      # @param options A hash of options used to construct the search query.
      # @return FHIR::ClientReply
      #
      def search(klass, options={}, format=@default_format_bundle)
        options.merge!({ resource: klass, format: format })
        reply = get resource_url(options), fhir_headers(options)
        reply.resource = parse_reply(klass, format, reply)
        reply.resource_class = klass
        reply
      end

      def search_existing(klass, id, options={}, format=@default_format_bundle)
        options.merge!({ resource: klass, id: id, format: format })
        reply = get resource_url(options), fhir_headers(options)
        reply.resource = parse_reply(klass, format, reply)
        reply.resource_class = klass
        reply
      end

      def search_all(options={}, format=@default_format_bundle)
        options.merge!({ format: format })
        reply = get resource_url(options), fhir_headers(options)
        reply.resource = parse_reply(nil, format, reply)
        reply.resource_class = nil
        reply
      end

    end
  end
end