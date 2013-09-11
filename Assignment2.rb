class Dessert


    def initialize(name, calories)
        @name = name
        @calories = calories
    end

    def healthy?
    	@calories < 100 
    end

    def delicious?
        true
    end
end

class JellyBean < Dessert
    def initialize(name, calories, flavor)
        super(name, calories)
        @flavor = flavor
    end

    def delicious?
        !(@flavor == "black licorice")
    end
end

cake = Dessert.new("Cheesecake", 100)
jelly = JellyBean.new("Jelly", 20, "black licorice")
p jelly.delicious?
p cake.healthy?