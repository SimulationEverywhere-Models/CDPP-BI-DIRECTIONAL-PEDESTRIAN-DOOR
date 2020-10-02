/*******************************************************************
*
*  DESCRIPTION: Atomic Model Door Controller
*
*  AUTHOR:  Ronnie Farrell
*
*  EMAIL: ronnie@sce.carleton.ca
*
*  DATE: December 7, 2011
*
*******************************************************************/

#ifndef __DOORCONTROLLER_H
#define __DOORCONTROLLER_H

#include "atomic.h"     // class Atomic

class DoorController : public Atomic
{
public:
	DoorController( const string &name = "DoorController" );			//Default constructor
	virtual string className() const { return "DoorController";}
	~DoorController();

protected:
	Model &initFunction();
	Model &externalFunction( const ExternalMessage & );
	Model &internalFunction( const InternalMessage & );
	Model &outputFunction( const InternalMessage & );

private:
	const Port          &inHall;			//inputs from the hall
	const Port			&inRoom;			//inputs from the room

	Port                &outHall;			//outputs to the hall
	Port                &outRoom;			//outputs to the room

	int					value;
	int				    fromRoom;			// 0 = input from hall, 1 = input from room

	Time controllerTime;
	enum State{
		Idle,
		Perform
	};
	State state;

};	// class DoorController

#endif   //__DOORCONTROLLER_H

