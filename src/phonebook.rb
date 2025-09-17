class PhoneBook
    def initialize
        @name = {}
        @number = {}
        @listed = {}
    end

    def add(name, number, is_listed)
        return false if @name.key?(name) 
        return false if !number.match?(/^\d{3}-\d{3}-\d{4}$/)
        return false if is_listed && @listed.key?(number)

        @name[name] = {number: number, is_listed: is_listed}
        @number[number] ||= {} 
        @number[number][name] = {is_listed: is_listed}
        @listed[number] = name if is_listed

        return true
    end

    def lookup(name)
        return nil if !@name.has_key?(name)
        lookname = @name[name]
        if lookname[:is_listed]
            return lookname[:number] 
        else 
            return nil
        end
    end

    def lookupByNum(number)
        return @listed[number]
    end

    def namesByAc(areacode)
        areaname = []
        @number.each do |number, listname|
            if number.split("-")[0] == areacode
                listname.each_key do |name|
                    areaname << name 
                end
            end
        end
        areaname
    end
end
