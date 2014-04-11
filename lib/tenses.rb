require "tenses/version"

OPTIONS = {
  :tense =>     [:present,    :past,       :future],
  :person =>    [:third,      :first,      :second],
  :plurality => [:singular,   :plural],
  :diathesis => [:active,     :passive],
  :mood =>      [:indicative, :imperative, :subjunctive],
  :aspect =>    [:habitual,   :perfective, :habitual, :progressive, :perfect, :prospective]  
}

DEFAULTS = {
  :tense =>     :present,
  :person =>    :third,
  :plurality => :singular,
  :diathesis => :active,
  :mood =>      :indicative,
  :aspect =>    :habitual  
}



String.class_eval do

  OPTIONS.each do |key, value|
    value.each do |my_method|
      # 1. Excluded keys => should be with default values
      # 2. 
      # 3. 
    end
  end

  def to_past
    Verbs::Conjugator.conjugate self.to_sym, 
      :tense      => :past,
      :person     => :second, 
      :plurality  => :singular, 
      :aspect     => :perfective
  end

protected
  def convert

  end
end

def convert(hash)
  hash.each do |k, v|
    keys = hash.keys
    keys = keys - [k]
    keys.each do |key|
      v.product(hash[key]).each do |item|
        p item.join("_")
        excluded_keys = keys - [k, key]
        default_params = {}
        excluded_keys.each do |ek|
          p default_params.merge!(ek.to_sym => DEFAULTS[ek])
        end
      end
    end
  end
end