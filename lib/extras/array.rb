# Frozen-string-literal: true
# Copyright: 2015-2016 Jordon Bedwell - MIT License
# Encoding: utf-8

module Extras
  module Array
    ALLOWED_OBJECTS = [NilClass, Hash, TrueClass, FalseClass,
      Regexp, Array, Set, Fixnum, Bignum, Float].freeze

    # Stringify an array's keys, skipping anything within the allowed list.
    # Note: the allowed is an all or nothing style override, sorry for this...
    # allowed - the objects you wish to allow to pass.
    def stringify(allowed: ALLOWED_OBJECTS)
      allowed = [] if allowed.nil?

      map do |v|
        allowed.include?(v.class) ? v : \
        if !v.respond_to?(:stringify)
          v.to_s

        else
          v.stringify({
            :allowed => allowed
          })
        end
      end
    end

    # Symbolize an array's keys, skpping anything within the allowed list.
    # Note: the allowed is an all or nothing style override, sorry for this...
    # allowed - the objects you wish to allow to pass.
    def symbolize(allowed: ALLOWED_OBJECTS)
      allowed = [] if allowed.nil?

      map do |v|
        allowed.include?(v.class) ? v : \
        if !v.respond_to?(:symbolize)
          v.to_s.to_sym else v.symbolize({
            :allowed => allowed
          })
        end
      end
    end
  end
end

class Array
  prepend Extras::Array
end
