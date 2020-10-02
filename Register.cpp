/*******************************************************************
*
*  DESCRIPTION: Simulator::registerNewAtomics()
*
*  AUTHOR: Ronnie Farrell
*
*  EMAIL: ronnie@sce.carleton.ca
*
*  DATE: December 7, 2011
*
*******************************************************************/

#include <modeladm.h>
#include <mainsimu.h>

/* New libraries are copied after this line */
#include "DoorController.h"
#include "generat.h"

void MainSimulator::registerNewAtomics()
{

//New models are registered after this line
SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<DoorController>() , "DoorController" ) ;
SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<Generator>() , "Generator" ) ;

}
