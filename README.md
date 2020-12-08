# PDDL_task_allocation
Task allocation for multi-robot multiple pallets as a possible step prior to the warehouse automation in a day to get an optimal assignment of tasks to robots.

The easy problems are solveable by [Fast-Downward](http://www.fast-downward.org/) but to solve everything, you need to do this [^1]:

Install singularity:

`git clone https://github.com/singularityware/singularity.git`

`cd singularity`

`git checkout 2.4`

`./autogen.sh`

`./configure --prefix=/usr/local`

`make`

`sudo make install`

Download: https://drive.google.com/open?id=1FonR2VO5OaB2fbdCWqN8IRLCJZ-GVAY_

`git clone https://bitbucket.org/ipc2018-temporal/team3.git`

`sudo singularity build planner.img TempPlanner.img`

`mkdir rundir`

`cp path/to/domain.pddl rundir`

`cp path/to/problem.pddl rundir`

`RUNDIR="$(pwd)/rundir"`

`DOMAIN="$RUNDIR/domain.pddl"`

`PROBLEM="$RUNDIR/problem.pddl"`

`PLANFILE="$RUNDIR/sas_plan"`

`singularity run -C -H $RUNDIR planner.img $DOMAIN $PROBLEM $PLANFILE`
`


[^1] procedure taken from https://icenamor.github.io/portfolio/Temporal/
