class MealyFSM:
    # State Definitions
    S0 = 0
    S1 = 1
    S2 = 2
    S3 = 3

    def __init__(self):
        self.pstate = self.S0  # Initial state
        self.y = 0  # Output

    def next_state(self, x):
        """Determine the next state and output based on current state and input."""
        if self.pstate == self.S0:
            if x:
                self.y = 0
                return self.S1
            else:
                self.y = 0
                return self.S0
        elif self.pstate == self.S1:
            if x:
                self.y = 0
                return self.S2
            else:
                self.y = 0
                return self.S0
        elif self.pstate == self.S2:
            if x:
                self.y = 0
                return self.S3
            else:
                self.y = 0
                return self.S0
        elif self.pstate == self.S3:
            if x:
                self.y = 1
                return self.S3
            else:
                self.y = 0
                return self.S0

    def clock_tick(self, x):
        """Simulate the clock tick and update the state."""
        nstate = self.next_state(x)  # Determine next state
        self.pstate = nstate  # Update present state

    def get_output(self):
        """Return the current output."""
        return self.y


# Example usage
if __name__ == "__main__":
    fsm = MealyFSM()
    inputs = [1, 1, 1, 0, 1, 1, 1]  # Example input sequence
    outputs = []
    for x in inputs:
        fsm.clock_tick(x)  # Simulate clock tick with input x
        outputs.append(fsm.get_output())  # Collect output

    print("Output sequence:", outputs)
