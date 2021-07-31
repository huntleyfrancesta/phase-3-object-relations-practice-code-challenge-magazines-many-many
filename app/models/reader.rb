class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        Subscription.create(magazine_id: magazine.id, price: price, reader_id: self.id)
    end

    def total_subscription_price
        self.subscriptions.map{|sub| sub.price}.sum
    end

    def cancel_subscription(magazine)
        self.subscriptions.find{|sub| sub.magazine == magazine}.destroy
    end

end