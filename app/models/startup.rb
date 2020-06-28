class Startup

    attr_reader :name, :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_founder(name)
        all.find { |startup| startup.founder == name }
    end

    def self.domains
        all.map { |startup| startup.domain }
    end

    def pivot(domain, name)
        @name = name
        @domain = domain
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def funding_rounds
        FundingRound.all.select { |fr| fr.startup == self }
    end

    def num_funding_rounds
        self.funding_rounds.count
    end

    def total_funds
        total = 0
        self.funding_rounds.map { |fr| 
            total += fr.investment }
        total
    end

    def investors
        self.funding_rounds.map { |fr| fr.venture_capitalist }.uniq
    end

    def big_investors
        self.investors.select { |i| i.total_worth >= 1_000_000_000 }.uniq
    end
end
