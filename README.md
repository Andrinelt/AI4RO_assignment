AI4RO_assignment
# Assignment D2-V6: Domestic Service Robot – Appliance Capacity Constraints

### Scenario
A robot prepares beverages using kitchen appliances such as a kettle and a coffee machine. These appliances have limited capacity (maximum volume of water that can be heated or processed at once).
The robot manage resources efficiently, ensuring that capacity constraints are respected while completing preparation tasks.

### Domain Characteristics
- Robot: single manipulator
- Environment: kitchen with appliances (kettle and coffee maker)
- Tasks: preparation involving shared resources
- Constraints: appliance capacity limits

## Modelling
The task of preparing coffee and tea beverages is devided into the action of filling appliance with water, heating the appliance and then lastly prepare it.

### Basic PDDL Model
- The capacity of each appliance is sat to a maximum volume.
    - Problem 1a is where capacity is sufficient, meaning the beverage goal volume is less than the maximum capacity for each appliance.
    - Problem 1b is where capacity constraints require multiple operations, meaning the robot needs to refill the appliances in order to reach the goal volume.
- SKRIV LITT OM DETTE Provide valid plans and justify modelling choices.

#### Plans of Basic PDDL Model

![Alt text](plans/plan_1a.png)


### PDDL+ Model
In the pddl+ model, the task of filling water is now modeled as a process with an overflow event. 

#### Plans of PDDL+ Model

- Show how timing affects appliance usage.

Run using this enhsp-20.jar with **`/opt/homebrew/opt/openjdk@17/bin/java -jar ~/Downloads/enhsp-20.jar \-o domain.pddl \-f problem.pddl \-s WAStar -wh 2`**


## Discussion
Discuss:
- modelling shared resources (mutex)
- discrete vs continuous capacity representations
