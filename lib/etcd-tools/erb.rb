require 'erb'
require 'etcd-tools/etcd'

module EtcdTools
  class Erb < ::ERB
    include EtcdTools::Etcd

    attr_reader :etcd

    def initialize (etcd, template, requires=['yaml'])
      requires.each do |r|
        require r
      end
      @etcd = etcd
      super template
    end

    def result
      super binding
    end

    def value path
      return @etcd.get('/' + path.sub(/^\//, '')).value
    end

    def keys path
      path.sub!(/^\//, '')
      if @etcd.get('/' + path).directory?
        return @etcd.get('/' + path).children.map { |key| key.key }
      else
        return []
      end
    end

    def members
      Hash[ @etcd.members.map { |id, md| [ id, md.merge({ "ip" => md["clientURLs"].first.sub(/https?:\/\//, '').sub(/:[0-9]+/, '') }) ] } ]
    end

  end
end
