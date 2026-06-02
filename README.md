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
The task of preparing coffee and tea beverages is devided into the action of filling appliance with water, heating the appliance and then lastly prepare the beverage. The capacity constraints prevent the appliances from being treated as unlimited resources.

### 1 Basic PDDL Model (Discrete Capacity)
With the basic PDDL model, appliance capacity is modelled as a maximum number of discrete portions. The action of fill-portion, only fills one portion at a time. The appliance has to be heated before it can prepare the beverage portions, and the appliances cannot be filled with water again until it has prepared all portions of beverages. In order to do this, the action refill is implemented.
- Problem 1a is where capacity is sufficient, meaning the beverage goal portions is less than the maximum capacity for each appliance.
- Problem 1b is where capacity constraints require multiple operations, meaning the robot needs to refill the appliances in order to reach the goal volume.

The model treats every action as equal cost, which creates a plan that is not optimized according to the real world. In plan_1a, the goal is to make 3 portions of tea and 4 portions of coffe, while both kettle and coffee-maker has capacity of 5 potions. The plan is that the robot only fill the coffee-maker with 2 portions instead of 4, which means it will have to heat, refill portions and then heat again. The heating of the water is timeconsuming in the real world, but is instantenious in this domain, which is why it result in equal cost.

#### Plans of Basic PDDL Model

<table>
  <tr>
    <td align="center">
      <img src="plans/plan_1a.png" width="450"><br>
      <b>Figure 1.</b> Sufficient discrete capacity model (plan_1a)
    </td>
    <td align="center">
      <img src="plans/plan_1b.png" width="450"><br>
      <b>Figure 2.</b> Insufficient discrete capacity model (plan_1b)
    </td>
  </tr>
</table>


### 2 PDDL+ Model (Continous Capacity)
In the PDDL+ model, the appliance capacity is modelled as continous volume represented as milliliters. 
The domain is kept simple where only the action of filling water is modelled as a process with an overflow-event. By adding this event, the robot is forced to fill the appliance until it is full, before it can put it on heat. This logic may not be optimal because the robot ends up making more than it actually needs to. An improvement of this could possibly be to implement a stop-filling action the robot could execute before the overflow-event happens.

All actions should be modelled with a process and event in order to give a better representation of the real world, and how timing affects the plans. This includes both the heating and beverege preparing. It is however not implemented yet.

The function `fill-rate` represent how fast the current volume increases as water is filled.

#### Plans of PDDL+ Model

<table>
  <tr>
    <td align="center">
      <img src="plans/plan_2c.png" width="450"><br>
      <b>Figure 1.</b> Sufficient continous capacity model (plan_2c)
    </td>
    <td align="center">
      <img src="plans/plan_2e.png" width="450"><br>
      <b>Figure 2.</b> Insufficient continous capacity model (plan_2e)
    </td>
  </tr>
</table>


## Discussion
#### Modelling shared resources
In the discrete model, the planner alternates the filling operations on the kettle and coffee maker, rather than completing one of them first. 

In the PDDL+ model, the shared resource is represented more explicitly where both appliances has to share the tap. The robot is only able to fill one appliance at a time. To ensure this, a global mutex `tap-in-use` predicate is used to introduce scheduling considerations. Without this the robot can alternate the filling processes of kettle and coffee maker, which is not optimum in the real world. 

The advantage of modelling the shared resource explicity is that the plan becomes more realistic. The planner must consider, not only if the task is possible, but also whether sufficient capacity and resource availability exists at the same time.

#### Discrete vs continuous capacity representations
The discrete capacity representation is accomplished by doing the same action (`fill-portion`) multiple times, which gives the robot more freedom to choose how many portion fillings it does before heating and preparing. All actions happens instantenious, which means that timing has little influnece on capacity management. This is not a valid representation of the real world.

The continous capacity model allows the filling process to increase continously in time. Timing becomes relevant where the amount of water depends on how long the filling process runs. This makes the model closer to the real world.

The trade-off is in complexity. The discrete case is less accurate to the real world, but it is also less computationally heavy. The continues model is more real-world-like, but requires processes, events, temporal resonning which makes planning more computationally demanding.

## Usage
Run using this enhsp-20.jar with `\-s WAStar -wh 2`