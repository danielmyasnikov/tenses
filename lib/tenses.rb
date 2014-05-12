require "tenses/version"


String.class_eval do

  OPTIONS = {
    :tense =>     [:present,    :past,       :future],
    :person =>    [:third,      :first,      :second],
    :plurality => [:singular,   :plural],
    :diathesis => [:active,     :passive],
    :mood =>      [:indicative, :imperative, :subjunctive],
    :aspect =>    [:habitual,   :perfective, :progressive, :perfect, :prospective]
  }

  DEFAULTS = {
    :tense =>     :present,
    :person =>    :third,
    :plurality => :singular,
    :diathesis => :active,
    :mood =>      :indicative,
    :aspect =>    :habitual  
  }

  # Verbs::Conjugator.conjugate self.to_sym, 
  #   :tense      => :past,
  #   :person     => :second, 
  #   :plurality  => :singular, 
  #   :aspect     => :perfective

  

  
  def get_methods
    OPTIONS.values.map{ |v| v + [nil]}.inject(&:product).map(&:flatten).map(&:compact)
  end

  def methods_to_string(methods)
    string_methods = []
    methods.each do |method|
      string_methods << method.join("_")
    end
    string_methods
  end

  def find_excluded_keys(method)
    method.symbols - DEFAULT.keys
  end

  def symbols(method)
    method.split("_").map(&:to_sym)
  end

  def find_key_by_value(symbols)
    excluded_keys = []
    OPTIONS.each do |key, value|
      excluded_keys << key if (symbols & value).empty?
    end
    excluded_keys
  end

  def get_defaults(excluded_keys)
    default_params = {}
    excluded_keys.each do |ek|
      default_params.merge!(ek.to_sym => DEFAULTS[ek])
    end
    default_params
  end

end


