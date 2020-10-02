/*******************************************************************
*
*  DESCRIPTION: Atomic Model Door Controller
*
*  AUTHOR: Ronnie Farrell
*
*  Email: ronnie@sce.carleton.ca
*
*  DATE: December 7, 2011
*
*******************************************************************/

/** include files **/
#include <math.h>           // fabs( ... )
#include <stdlib.h>
#include "DoorController.h"  		// base header
#include "message.h"      	// InternalMessage ....
#include "mainsimu.h"     	// class MainSimulator
#include "strutil.h"        // str2float( ... )

/*******************************************************************
* Function Name: DoorController
* Description: constructor
********************************************************************/
DoorController::DoorController( const std::string &name ) : Atomic( name )
, inHall( addInputPort( "inHall" ) )
, inRoom( addInputPort( "inRoom" ) )
, outHall( addOutputPort( "outHall" ) )
, outRoom( addOutputPort( "outRoom" ) )
, controllerTime (00,00,00,100)
{
	std::string timeController( MainSimulator::Instance().getParameter( description(), "doorProcessingTime" ) ) ;
//test
	if (timeController !="") controllerTime = timeController;

	//MainSimulator::Instance().Spin_Motor_Clockwise(30);

	cout<<"controllerTime="<<controllerTime<<"\n";
}

/*******************************************************************
* Function Name: DoorController::initFunction()
* Description: Initialization Function
********************************************************************/
Model &DoorController::initFunction()
{

	this->state = Idle;		// detecting
	return *this ;
}
/*******************************************************************
* Function Name: DoorController::externalFunction()
* Description: External Function DoorController
********************************************************************/
Model &DoorController::externalFunction( const ExternalMessage &msg )
{

	if (state == Idle && msg.port() == inHall)
	{
		this->state = Perform;
		this->value = msg.value();
		this->fromRoom = 0;
		this->holdIn(Atomic::active, controllerTime);
	}
	else if (state == Idle && msg.port() == inRoom)
	{
		this->state = Perform;
		this->value = msg.value();
		this->fromRoom = 1;
		this->holdIn(Atomic::active, controllerTime);
	}
	return *this;
}

/*******************************************************************
* Function Name: DoorController::internalFunction()
* Description: Internal Function DoorController
********************************************************************/
Model &DoorController::internalFunction( const InternalMessage & )
{
	if(state == Perform){
		this->state = Idle;
		this->passivate();
	}

	return *this;
}

/*******************************************************************
* Function Name: DoorController::outputFunction()
* Description: Output function DoorController - writes info about time and events
********************************************************************/
Model &DoorController::outputFunction( const InternalMessage &msg )
{
	// person walks from hall to room
	if (state == Perform && fromRoom == 0){
		this->sendOutput( msg.time(), this->outHall, this->value) ;//pedestrian exited hall / entered room
	}
	// person walks from room to hall
	else if(state == Perform && fromRoom == 1)
	{
		this->sendOutput( msg.time(), this->outRoom, this->value) ;//pedestrian exited room / entered hall
	}
	return *this ;
}

DoorController::~DoorController()
{
	//MainSimulator::Instance().Spin_Motor_Stop();
}
