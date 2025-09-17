def fib(n)
    if n == 0
        return []
    elsif n == 1
        return [0]
    else
        array = [0,1]
        while array.length < n 
            array.push(array[-1] + array[-2])
        end
        return array  
    end
end

def isPalindrome(n)
    string = n.to_s
    string == string.reverse 
end

def nthmax(n, a)
    return nil if n >= a.length
    
    sorts = a.sort
    large_to_small = sorts.reverse
    large_to_small[n]
end

def freq(s)
    if s == ""
        return ""       
    else
        count = Hash.new(0)
        s.each_char {|n| count[n] += 1}
        count.key(count.values.max)
    end
end

def zipHash(arr1, arr2)
    return nil if arr1.length != arr2.length
    Hash[arr1.zip(arr2)]
end

def hashToArray(hash)
    hash.to_a 
end
