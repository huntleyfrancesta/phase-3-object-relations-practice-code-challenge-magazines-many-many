    #has_many(:readers, through: :subscriptions) same as>
    has_many :readers, through: :subscriptions

    def email_list
        self.readers.map{|reader| "#{reader.email};"}.join
    end

    def self.most_popular
        self.all.max_by{|mag| mag.subscriptions.length}
    end


end