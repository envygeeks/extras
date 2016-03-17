# Frozen-string-literal: true
# Copyright: 2015-2016 Jordon Bedwell - MIT License
# Encoding: utf-8

module Extras
  module Hash
    ALLOWED_OBJECTS = [NilClass, Hash, TrueClass, FalseClass,
      Regexp, Array, Set, Fixnum, Bignum, Float].freeze

    # allowed - a list of classes to allow.
    # Symbolize keys and values of the current hash, skipping objects that are
    # allowed to be skipped (leaving them as is, untouched.)
    def symbolize(allowed: ALLOWED_OBJECTS)
      allowed ||= []; each_with_object({}) do |(k, v), h|
        k = k.to_sym unless !k.respond_to?(:to_sym) || allowed.include?(k.class)
        v = v.to_sym unless !v.respond_to?(:to_sym) || allowed.include?(v.class)
        h[k] = !v.respond_to?(:symbolize) ? v : v.symbolize({
          :allowed => allowed
        })
      end
    end

    # allowed - a list of the classes to allow.
    # Stringify keys and values of the current hash, skipping objects that are
    # allowed to be skipped (leaving them as is, untouched.)
    def stringify(allowed: ALLOWED_OBJECTS)
      allowed ||= []; each_with_object({}) do |(k, v), h|
        v = v.to_s if !v.respond_to?(:stringify) && !allowed.include?(v.class)
        k = k.to_s unless allowed.include?(k.class)

        h[k] = !v.respond_to?(:stringify) ? v : v.stringify({
          :allowed => allowed
        })
      end
    end

    # allowed - a list of classes to allow.
    # Stringify the keys of the current hash, skipping objects that are
    # allowed to be skipped (leaving them as is, untouched.)
    def stringify_keys(allowed: ALLOWED_OBJECTS)
      allowed = [] if allowed.nil?

      each_with_object({}) do |(k, v), h|
        unless allowed.include?(k.class)
          k = k.to_s
        end

        h[k] = \
        if !v.respond_to?(:stringify_keys)
          then v
        else
          v.stringify_keys({
            :allowed => allowed
          })
        end
      end
    end

    # allowed - a list of classes to allow.
    # Symbolize the keys of the current hash, skipping objects that are
    # allowed to be skipped (leaving them as is, untouched.)
    def symbolize_keys(allowed: ALLOWED_OBJECTS)
      allowed = [] if allowed.nil?
      each_with_object({}) do |(k, v), h|
        if k.respond_to?(:to_sym) && !allowed.include?(k.class)
          k = k.to_sym
        end

        h[k] = \
        if !v.respond_to?(:symbolize_keys)
          then v

        else
          v.symbolize_keys({
            :allowed => allowed
          })
        end
      end
    end

    # Merge hash into hash into hash into hash.
    # new_h - the hash you wish to merge in.
    def deep_merge(new_h)
      merge(new_h) do |_, ov, nv|
        if ov.respond_to?(:deep_merge) && nv.respond_to?(:deep_merge)
          then ov.deep_merge(
            nv
          )

        else
          return nv
        end
      end
    end

    # keys - the keys you wish to determine exist or not.
    # Check to see if any of the given keys exist.
    def any_key?(*keys)
      keys.any? do |k|
        key?(k)
      end
    end
  end
end

class Hash
  prepend Extras::Hash
end
