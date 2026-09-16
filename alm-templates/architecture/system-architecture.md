# System Architecture

The shape of the system: major components, how they talk to each other, and — critically — *why* it's shaped this way, not just what the shape is. A diagram is worth including if the component relationships aren't obvious from prose alone.

## Components

<One subsection per major component/service/module.>

### <Component name>

**Responsibility:** <what this owns, in one or two sentences>

**Talks to:** <what it calls, what calls it>

**Why it's separate from <related component>:** <the boundary reasoning — this is the part that's easy to skip and expensive to lose>

## Data flow

<How a request/piece of data actually moves through the system end to end, at least for the one or two flows that matter most.>
