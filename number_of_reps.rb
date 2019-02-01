total_num_reps = 680

class State
    def initialize name:, population: 0, num_reps: 1
        @name, @population, @num_reps = name, population, num_reps
    end
    def increment_reps
        @num_reps += 1
    end
    def constituents_per_rep
        @population.to_f / @num_reps.to_f
    end
    def to_s
        "#{@name.ljust 15} #{@population.to_s.rjust 8}, #{@num_reps}"
    end
    def <=> other
        self.constituents_per_rep <=> other.constituents_per_rep
    end
    attr_reader :name, :population, :num_reps
end

states = Array.new

def clean_line line
    info = line.gsub(',','').gsub(/\(.*\)/,'').gsub(/\[.*\]/,'').strip.split(/\s/)
    if info[0] !~ /\D/ then info.delete_at(0) end
    info
end

File.open("nationstates.txt", "r") do |file|
    file.each_line do |line|
        states.push(
            #State.new population: info.pop.to_i, name:
            clean_line(line).join(' '))

    end
end

for i in 0...(total_num_reps - states.length)
    states.max.increment_reps
end

puts states
