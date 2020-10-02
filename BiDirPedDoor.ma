[top]
components : Room
components : Hall
components : door1@DoorController door2@DoorController
% Generators for the room
components : pedestrianRoom1@Generator pedestrianRoom2@Generator
components : pedestrianRoom3@Generator pedestrianRoom4@Generator
components : pedestrianRoom5@Generator pedestrianRoom6@Generator
components : pedestrianRoom7@Generator pedestrianRoom8@Generator
components : pedestrianRoom9@Generator pedestrianRoom10@Generator
% Generators for the hall
components : pedestrianHall1@Generator pedestrianHall2@Generator
components : pedestrianHall3@Generator pedestrianHall4@Generator
components : pedestrianHall5@Generator pedestrianHall6@Generator

% Link the pedestrians to the entrance of the room
link : out@pedestrianRoom1 entranceRoom1@Room
link : out@pedestrianRoom2 entranceRoom2@Room
link : out@pedestrianRoom3 entranceRoom3@Room
link : out@pedestrianRoom4 entranceRoom4@Room
link : out@pedestrianRoom5 entranceRoom5@Room
link : out@pedestrianRoom6 entranceRoom6@Room
link : out@pedestrianRoom7 entranceRoom7@Room
link : out@pedestrianRoom8 entranceRoom8@Room
link : out@pedestrianRoom9 entranceRoom9@Room
link : out@pedestrianRoom10 entranceRoom10@Room

% link the pedestrians to the entrance of the hall
link : out@pedestrianHall1 entranceHall1@Hall
link : out@pedestrianHall2 entranceHall2@Hall
link : out@pedestrianHall3 entranceHall3@Hall
link : out@pedestrianHall4 entranceHall4@Hall
link : out@pedestrianHall5 entranceHall5@Hall
link : out@pedestrianHall6 entranceHall6@Hall

% Link the hallway to the room
link : exitHallDoor1@Hall inHall@door1
link : outHall@door1 entranceRoomDoor1@Room
link : exitHallDoor2@Hall inHall@door2
link : outHall@door2 entranceRoomDoor2@Room

% Link the room to the hallway
link : exitRoomDoor1@Room inRoom@door1
link : outRoom@door1 entranceHallDoor1@Hall
link : exitRoomDoor2@Room inRoom@door2
link : outRoom@door2 entranceHallDoor2@Hall

[Hall]
type : cell
width : 6
height : 10
delay : transport
defaultDelayTime : 400
border : nonwrapped
neighbors : 				Hall(2,-1)  Hall(2,0)  Hall(2,1)
neighbors : 				Hall(1,-1)  Hall(1,0)  Hall(1,1)
neighbors : 	 Hall(0,-2) Hall(0,-1)  Hall(0,0)  Hall(0,1) Hall(0,2)
neighbors : 				Hall(-1,-1) Hall(-1,0) Hall(-1,1)
neighbors : 				Hall(-2,-1) Hall(-2,0) Hall(-2,1)
%%%% state values %%%%
% 0 - cell unoccupied
% 1 - cell occupied with an up walker
% 2 - cell occupied with a down walker
% 3 - cell occupied with an obstacle
initialvalue : 0
%initialrowvalue : 0 010001
%initialrowvalue : 1 001000
localtransition : PedestrianBehaviour

in : entranceHall1 entranceHall2
in : entranceHall3 entranceHall4
in : entranceHall5 entranceHall6

link : entranceHall1 entranceHall1@Hall(9,0)
link : entranceHall2 entranceHall2@Hall(9,1)
link : entranceHall3 entranceHall3@Hall(9,2)
link : entranceHall4 entranceHall4@Hall(9,3)
link : entranceHall5 entranceHall5@Hall(9,4)
link : entranceHall6 entranceHall6@Hall(9,5)

in : entranceHallDoor1 entranceHallDoor2

link : entranceHallDoor1 entranceHallDoor1@Hall(0,2)
link : entranceHallDoor2 entranceHallDoor2@Hall(0,3)

out : exitHallDoor1 exitHallDoor2

link : exitHallDoor1@Hall(0,2) exitHallDoor1 
link : exitHallDoor2@Hall(0,3) exitHallDoor2 

zone : hall-boundary-rules { (0,0)..(0,5) }

portInTransition : entranceHall1@Hall(9,0) hall-entrance-rule
portInTransition : entranceHall2@Hall(9,1) hall-entrance-rule
portInTransition : entranceHall3@Hall(9,2) hall-entrance-rule
portInTransition : entranceHall4@Hall(9,3) hall-entrance-rule
portInTransition : entranceHall5@Hall(9,4) hall-entrance-rule
portInTransition : entranceHall6@Hall(9,5) hall-entrance-rule

portInTransition : entranceHallDoor1@Hall(0,2) door-entrance-rule
portInTransition : entranceHallDoor2@Hall(0,3) door-entrance-rule

[Room]
type : cell
width : 10
height : 10
delay : transport
defaultDelayTime : 400
border : nonwrapped
neighbors : 				Room(2,-1)  Room(2,0)  Room(2,1)
neighbors : 				Room(1,-1)  Room(1,0)  Room(1,1)
neighbors : 	 Room(0,-2) Room(0,-1)  Room(0,0)  Room(0,1) Room(0,2)
neighbors : 				Room(-1,-1) Room(-1,0) Room(-1,1)
neighbors : 				Room(-2,-1) Room(-2,0) Room(-2,1)
%%%% state values %%%%
% 0 - cell unoccupied
% 1 - cell occupied with an up walker
% 2 - cell occupied with a down walker
% 3 - cell occupied with an obstacle
initialvalue : 0
% add obstacles to room
initialrowvalue : 5 0030000300
%initialrowvalue : 8 0000002000
%initialrowvalue : 9 0202000200
localtransition : PedestrianBehaviour

in : entranceRoom1 entranceRoom2
in : entranceRoom3 entranceRoom4
in : entranceRoom5 entranceRoom6
in : entranceRoom7 entranceRoom8
in : entranceRoom9 entranceRoom10

link : entranceRoom1 entranceRoom1@Room(0,0)
link : entranceRoom2 entranceRoom2@Room(0,1)
link : entranceRoom3 entranceRoom3@Room(0,2)
link : entranceRoom4 entranceRoom4@Room(0,3)
link : entranceRoom5 entranceRoom5@Room(0,4)
link : entranceRoom6 entranceRoom6@Room(0,5)
link : entranceRoom7 entranceRoom7@Room(0,6)
link : entranceRoom8 entranceRoom8@Room(0,7)
link : entranceRoom9 entranceRoom9@Room(0,8)
link : entranceRoom10 entranceRoom10@Room(0,9)

in : entranceRoomDoor1 entranceRoomDoor2

link : entranceRoomDoor1 entranceRoomDoor1@Room(9,4)
link : entranceRoomDoor2 entranceRoomDoor2@Room(9,5)

out : exitRoomDoor1 exitRoomDoor2

link : exitRoomDoor1@Room(9,4) exitRoomDoor1 
link : exitRoomDoor2@Room(9,5) exitRoomDoor2 

zone : room-boundary-rules { (9,0)..(9,9) }

portInTransition : entranceRoom1@Room(0,0) room-entrance-rule
portInTransition : entranceRoom2@Room(0,1) room-entrance-rule
portInTransition : entranceRoom3@Room(0,2) room-entrance-rule
portInTransition : entranceRoom4@Room(0,3) room-entrance-rule
portInTransition : entranceRoom5@Room(0,4) room-entrance-rule
portInTransition : entranceRoom6@Room(0,5) room-entrance-rule
portInTransition : entranceRoom7@Room(0,6) room-entrance-rule
portInTransition : entranceRoom8@Room(0,7) room-entrance-rule
portInTransition : entranceRoom9@Room(0,8) room-entrance-rule
portInTransition : entranceRoom10@Room(0,9) room-entrance-rule

portInTransition : entranceRoomDoor1@Room(9,4) door-entrance-rule
portInTransition : entranceRoomDoor2@Room(9,5) door-entrance-rule

[PedestrianBehaviour]
%%%% Exit Rule %%%%
% An up walker hits the boundary, remove them from the grid
rule : 0 100 {(0,0)=1 and cellpos(0)=0}
% A down hits the boundary of the hall, remove them from the grid
rule : 0 100 {(0,0)=2 and cellpos(0)=9}

%%%% Rule 1 %%%%
% Move forward - up walkers
rule : 0 100 {(0,0)=1 and (-1,0)=0 and (-2,0)!=2}	 %the cell ahead is available and
rule : 1 100 {(0,0)=0 and (-1,0)!=2 and (1,0)=1}	 %the next cell is not a down walker
% Move forward - down walkers
rule : 0 100 {(0,0)=2 and (1,0)=0 and (2,0)!=1}		%the cell ahead is available and
rule : 2 100 {(0,0)=0 and (1,0)!=1 and (-1,0)=2}	%the next cell is not an up walker

%%%% Rule 2 %%%%
% There is a walker/obstacle ahead, move right if another walker isn`t going to walk there
% up walker
rule : 0 100 {(0,0)=1 and (-1,0)!=0		% walker or obstacle is next cell ahead
				and (-1,0)!=?			% walker not at border
				and (0,1)=0				% and the right side is available
				and (-1,1)!=2			% ensure down walker is not going for your cell
				and (1,1)!=1}			% ensure up walker is not going for your cell
rule : 1 100 {(0,0)=0 and (0,-1)=1		% move the up walker to the right
				and (-1,-1)!=0			% there is an obstacle or walker in cell (-1,-1)
				and (-1,-1)!=?			% walker not at border
				and (-1,0)!=2			% ensure down walker is not going for that cell
				and (1,0)!=1}			% ensure up walker is not going for that cell
% down walker
rule : 0 100 {(0,0)=2 and (1,0)!=0 		% walker or obstacle is next cell ahead
				and (1,0)!=?			% walker not at border
				and (0,-1)=0			% and the right side is available
				and (1,-1)!=1			% ensure up walker is not going for your cell
				and (-1,-1)!=2}			% ensure down walker is not going for your cell
				
rule : 2 100 {(0,0)=0 and (0,1)=2		% move the down walker to the right
				and (1,1)!=0			% there is an obstacle or walker in cell (1,1)
				and (1,1)!=?			% walker not at border
				and (1,0)!=1			% ensure up walker is not going for that cell
				and (-1,0)!=2}			% ensure down walker is not going for your cell
				
%%%% Rule 3 %%%%
% Walker/obstacle ahead and to the right, move to the left if another walker isn`t going to walk there
% up walker
rule : 0 100 {(0,0)=1 and (-1,0)!=0		% walker or obstacle is next cell ahead
				and (-1,0)!=?			% walker not at border
				and (0,1)!=0			% walker or obstacle is also to the right
				and (0,-1)=0			% the left side is available
				and (-1,-1)!=2			% ensure down walker is not going for left cell
				and (1,-1)!=1}			% ensure up walker is not going for left cell
rule : 1 100 {(0,0)=0 and (0,1)=1		% move the up walker to the left
				and (-1,1)!=0			% there is an obstacle or walker in cell (-1,1)
				and (-1,1)!=?			% walker not at border
				and (0,2)!=0			% there is an obstacle or walker in cell (0,2) also
				and (-1,0)!=2			% ensure down walker is not going for that cell
				and (1,0)!=1}			% ensure up walker is not going for that cell
% down walker
rule : 0 100 {(0,0)=2 and (1,0)!=0		% walker or obstacle is next cell ahead
				and (1,0)!=?			% walker not at border
				and (0,-1)!=0			% and the right side is an obstacle or walker
				and (0,1)=0				% the left side is available
				and (1,1)!=1			% ensure up walker is not going for left cell
				and (-1,1)!=2}			% ensure down walker is not going for left cell
				
rule : 2 100 {(0,0)=0 and (0,-1)=2		% move the down walker to the right
				and (1,-1)!=0			% there is an obstacle or walker in cell (1,-1)
				and (1,-1)!=?			% walker not at border
				and (0,-2)!=0			% there is an obstacle or walker in cell (0,-2) also
				and (1,0)!=1			% ensure up walker is not going for that cell
				and (-1,0)!=2}			% ensure down walker is not going for your cell
				
%%%% Rule 4 %%%%
% Avoid collision, move right if an up and down walker are vying for the same cell and it's possible
% up walker
rule : 0 100 {(0,0)=1 and (-1,0)=0 		% cell ahead is empty
				and (-2,0)=2 			% 2 cells ahead is down walker
				and (0,1)=0				% right cell is available
				and (-1,1)!=2			% ensure down walker is not going for right cell
				and (1,1)!=1}			% ensure up walker is not going for right cell
rule : 0 100 {(0,0)=1 and (-1,0)=0 		% cell ahead is empty
				and (-2,0)=2 			% 2 cells ahead is down walker
				and (0,1)=0				% right cell is available
				and (-1,1)!=2			% ensure down walker is not going for right cell
				and (1,1)=?}			% walker at entrance of room or hall
rule : 1 100 {(0,0)=0 and (0,-1)=1
				and (-2,-1)=2			% cell (-2,-1) is a down walker
				and (-1,-1)=0			% cell (-1,-1) is empty
				and (-1,0)!=2			% ensure down walker is not going for right cell
				and (1,0)!=1}			% ensure up walker is not going for right cell
% down walker
rule : 0 100 {(0,0)=2 and (1,0)=0		% cell ahead is empty
				and (2,0)=1				% 2 cells ahead is up walker
				and (0,-1)=0			% right cell is available
				and (1,-1)!=1			% ensure up walker is not going for right cell
				and (-1,-1)!=2}			% ensure down walker is not going for right cell
rule : 0 100 {(0,0)=2 and (1,0)=0		% cell ahead is empty
				and (2,0)=1				% 2 cells ahead is up walker
				and (0,-1)=0			% right cell is available
				and (1,-1)!=1			% ensure up walker is not going for right cell
				and (-1,-1)=?}			% walker at the entrance of room or hall
rule : 2 100 {(0,0)=0 and (0,1)=2
				and (2,1)=1				% cell (2,1) is an up walker
				and (1,1)=0				% cell (1,1) is empty
				and (1,0)!=1			% ensure up walker is not going for right cell
				and (-1,0)!=2}			% ensure down walker is not going for right cell				

%%%% Rule 5 %%%%
% Walker/obstacle ahead to the right and to the left, move backward if another walker isn`t going to walk there
% up walker
rule : 0 100 {(0,0)=1 and (-1,0)!=0		% walker or obstacle is next cell ahead
				and (-1,0)!=?			% walker not at border
				and (0,1)!=0			% walker or obstacle is also to the right
				and (0,-1)!=0			% walker or obstacle is also to the left
				and (1,0)=0				% cell behind is available
				and (2,0)!=1			% ensure up walker is not going for backward cell 
				and ((1,1)!=1 and (1,1)!=2)		% ensure walker from (1,1) is not going for backward cell
				and ((1,-1)!=1 and (1,-1)!=2)}	% ensure walker from (1,-1) is not going for backward cell
rule : 1 100 {(0,0)=0 and (-1,0)=1		% move the up walker backwards
				and (-2,0)!=?			% walker not at border
				and (-1,1)!=0			% there is an obstacle or walker in cell (-1,1)
				and (-1,-1)!=0			% there is an obstacle or walker in cell (-1,-1)
				and (-2,0)!=0			% there is an obstacle or walker in cell (-2,0)
				and (1,0)!=1			% ensure up walker is not going for that cell
				and ((0,-1)!=1 and (0,-1)!=2)	% ensure walker from (0,-1) is not going for that cell
				and ((0,1)!=1 and (0,1)!=2)}	% ensure walker from (0,1) is not going for that cell
% down walker
rule : 0 100 {(0,0)=2 and (1,0)!=0		% walker or obstacle is next cell ahead
				and (1,0)!=?			% walker not at border
				and (0,-1)!=0			% walker or obstacle is also to the right
				and (0,1)!=0			% walker or obstacle is also to the left
				and (-1,0)=0			% cell behind is available
				and (-2,0)!=2			% ensure down walker is not going for backward cell 
				and ((-1,1)!=1 and (-1,1)!=2)	% ensure walker from (-1,1) is not going for backward cell
				and ((-1,-1)!=1 and (-1,-1)!=2)}% ensure walker from (-1,-1) is not going for backward cell
rule : 2 100 {(0,0)=0 and (1,0)=2		% move the down walker backwards
				and (2,0)!=?			% walker not at border
				and (1,1)!=0			% there is an obstacle or walker in cell (1,1)
				and (1,-1)!=0			% there is an obstacle or walker in cell (1,-1)
				and (2,0)!=0			% there is an obstacle or walker in cell (2,0)
				and (-1,0)!=2			% ensure down walker is not going for that cell
				and ((0,-1)!=1 and (0,-1)!=2)	% ensure walker from (0,-1) is not going for that cell
				and ((0,1)!=1 and (0,1)!=2)}	% ensure walker from (0,1) is not going for that cell

%%%% Rule 6 %%%%
% Default - don't move
rule : {(0,0)} 100 {t}

[hall-entrance-rule]
% Assign a value of 1 to the pedestrians who are entering the hall and walking upwards
rule : 1 100 {portvalue(ThisPort)>0 and (-1,0)!=2 and ( ((0,0)=0 and cellpos(0)=9) or ((0,0)=2 and cellpos(0)=9) )}

% default - stay the same
rule : {(0,0)} 100 {t}

[room-entrance-rule]
%Assign a value of 2 to the pedestrians who are entering the room and walking downwards
rule : 2 100 {portvalue(ThisPort)>0 and (1,0)!=1 and ( ((0,0)=0 and cellpos(0)=0) or ((0,0)=1 and cellpos(0)=0) )}

% default - stay the same
rule : {(0,0)} 100 {t}

[hall-boundary-rules]
%%%% Rule 1 %%%%
% up walker at the door, exit the hall and send message to devs door model
rule : {0 + send(exitHallDoor1,1)} 100 {(0,0)=1 and cellpos(1)=2}
rule : {0 + send(exitHallDoor2,1)} 100 {(0,0)=1 and cellpos(1)=3}

%%%% Rule 2 %%%%
% have the up walkers enter the boundary
rule : 1 100 {(0,0)=0 and (1,0)=1}

%%%% Rule 3 %%%%
% up walker at the boundary on the right side of door, walk left		
rule : 0 100 {(0,0)=1					% walker is at boundary
				and cellpos(1)>2		% on the right side of door
				and (0,-1)=0		    % and the left side is available
				and (1,-1)!=1}			% ensure up walker is not going for your cell
rule : 1 100 {(0,0)=0 and (0,1)=1		% move the up walker to the left
				and cellpos(1)>2		% at the right side of the door
				and (1,0)!=1}			% ensure down walker is not going for your cell

%%%% Rule 4 %%%%
% up walker at the boundary on the left side of door, walk right		
rule : 0 100 {(0,0)=1			 		% walker is at boundary
				and cellpos(1)<3		% on the left side of door
				and (0,1)=0				% and the right side is available
				and (1,1)!=1}			% ensure up walker is not going for your cell
rule : 1 100 {(0,0)=0 and (0,-1)=1 		% move the up walker to the right
				and cellpos(1)<3		% at the left side of the door
				and (1,0)!=1}			% ensure up walker is not going for your cell

%%%% Rule 5 %%%%
% the down walker entered the hall, walk down
rule : 0 100 {(0,0)=2 and (1,0)=0}

% default
rule : {(0,0)} 100 {t}

[room-boundary-rules]
%%%% Rule 1 %%%%
% down walker at the door, exit the room and send message to devs door model
rule : {0 + send(exitRoomDoor1,2)} 100 {(0,0)=2 and cellpos(1)=4}
rule : {0 + send(exitRoomDoor2,2)} 100 {(0,0)=2 and cellpos(1)=5}

%%%% Rule 2 %%%%
% have the down walkers enter the boundary
rule : 2 100 {(0,0)=0 and (-1,0)=2}

%%%% Rule 3 %%%%
% at the boundary on right side of door, walk left		
rule : 0 100 {(0,0)=2					% walker is at boundary
				and cellpos(1)<5		% on the right side of door
				and (0,1)=0			    % and the left side is available
				and (-1,1)!=2}			% ensure down walker is not going for your cell
rule : 2 100 {(0,0)=0 and (0,-1)=2 		% move the down walker to the left
				and cellpos(1)<5		% at the right side of door
				and (-1,0)!=2}			% ensure down walker is not going for your cell

%%%% Rule 4 %%%%
% at the boundary on left side of door, walk right		
rule : 0 100 {(0,0)=2 			 		% walker is at boundary
				and cellpos(1)>4		% on the left side of door
				and (0,-1)=0			% and the right side is available
				and (-1,-1)!=2}			% ensure down walker is not going for your cell
rule : 2 100 {(0,0)=0 and (0,1)=2		% move the down walker to the left
				and cellpos(1)>4		% at the left side of door
				and (-1,0)!=2}			% ensure down walker is not going for your cell

%%%% Rule 5 %%%%
% the up walker entered the room, walk up
rule : 0 100 {(0,0)=1 and (-1,0)=0}  % after they enter the room

% default
rule : {(0,0)} 100 {t}

[door-entrance-rule]
% The pedestrian is ready to enter the room or hall through the door
rule : {portvalue(ThisPort)} 50 {t}

%----------Door Controller parameters-----------
[door1]
doorProcessingTime : 00:00:00:50

[door2]
doorProcessingTime : 00:00:00:50

%----------Room Generator parameters-----------
[pedestrianRoom1]
distribution : poisson
mean : 2.1
variance : 1
deviation : 1

[pedestrianRoom2]
distribution : poisson
mean : 1.8
variance : 1.2
deviation : 1.2

[pedestrianRoom3]
distribution : poisson
mean : 1.8
variance : 1.1
deviation : 1.1

[pedestrianRoom4]
distribution : poisson
mean : 2.6
variance : 1
deviation : 1

[pedestrianRoom5]
distribution : poisson
mean : 1.9
variance : 1.2
deviation : 1.2

[pedestrianRoom6]
distribution : poisson
mean : 1.8
variance : 0.4 
deviation : 0.4

[pedestrianRoom7]
distribution : poisson
mean : 2.4
variance : 1
deviation : 1

[pedestrianRoom8]
distribution : poisson
mean : 2
variance : 1
deviation : 1

[pedestrianRoom9]
distribution : poisson
mean : 1.9
variance : 0.9
deviation : 0.9

[pedestrianRoom10]
distribution : poisson
mean : 2.6
variance : 1
deviation : 1

%----------Hall Generator parameters-----------
[pedestrianHall1]
distribution : poisson
mean : 0.7
variance : 0.9
deviation : 0.9

[pedestrianHall2]
distribution : poisson
mean : 0.6
variance : 0.8
deviation : 0.8

[pedestrianHall3]
distribution : poisson
mean : 0.4
variance : 0.5
deviation : 0.5

[pedestrianHall4]
distribution : poisson
mean : 0.5
variance : 0.8
deviation : 0.8

[pedestrianHall5]
distribution : poisson
mean : 0.7
variance : 1
deviation : 1

[pedestrianHall6]
distribution : poisson
mean : 0.8
variance : 0.8
deviation : 0.8