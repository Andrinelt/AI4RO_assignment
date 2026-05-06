AI4RO_assignment
# Assignment D2-V6: Domestic Service Robot – Appliance Capacity Constraints

## Scenario
A robot prepares beverages using kitchen appliances such as a kettle and a
coffee machine. These appliances have limited capacity (e.g., maximum volume
of water that can be heated or processed at once).
The robot must manage resources efficiently, ensuring that capacity constraints are respected while completing preparation tasks.

## Domain Characteristics
- Robot: single manipulator or mobile manipulator
- Environment: kitchen with appliances
- Tasks: preparation involving shared resources
- Constraints: appliance capacity limits

## Modelling Guidelines
- Explicitly model appliance capacity (e.g., volume or number of items).
- Avoid modelling appliances as unlimited resources.
- Ensure that capacity constraints affect action feasibility.
- Represent filling, usage, and emptying operations explicitly.

## Q1 – Basic PDDL Model
You must:
- Represent capacity as a numeric fluent or structured predicates.
- Provide:
    - one problem where capacity is sufficient
    - one where capacity constraints require multiple operations
- Provide valid plans and justify modelling choices.

## Q2 – PDDL+ Model
You must:
- Introduce a process modelling gradual filling or emptying.
- Introduce an event representing overflow or capacity violation.
- Show how timing affects appliance usage.

## Discussion
Discuss:
- modelling shared resources
- discrete vs continuous capacity representations