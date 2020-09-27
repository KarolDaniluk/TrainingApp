#prototype
module Copy
    def shallow_copy
        self.clone
    end
    
    def deep_copy
        Marshal.load(Marshal.dump(self))
    end
end
