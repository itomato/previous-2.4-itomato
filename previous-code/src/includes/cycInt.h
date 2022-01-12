/*
  Hatari - cycInt.h

  This file is distributed under the GNU Public License, version 2 or at
  your option any later version. Read the file gpl.txt for details.
 
 (SC) Simon Schubiger - removed all MFP related code. NeXT does not have an MFP
*/

#ifndef HATARI_CYCINT_H
#define HATARI_CYCINT_H

#ifdef __cplusplus
extern "C" {
#endif

/* Interrupt handlers in system */
typedef enum
{
  INTERRUPT_NULL,
  INTERRUPT_VIDEO_VBL,
  INTERRUPT_HARDCLOCK,
  INTERRUPT_MOUSE,
  INTERRUPT_ESP,
  INTERRUPT_ESP_IO,
  INTERRUPT_M2M_IO,
  INTERRUPT_MO,
  INTERRUPT_MO_IO,
  INTERRUPT_ECC_IO,
  INTERRUPT_ENET_IO,
  INTERRUPT_FLP_IO,
  INTERRUPT_SND_OUT,
  INTERRUPT_SND_IN,
  INTERRUPT_LP_IO,
  INTERRUPT_SCC_IO,
  INTERRUPT_EVENT_LOOP,
  INTERRUPT_ND_VBL,
  INTERRUPT_ND_VIDEO_VBL,
  MAX_INTERRUPTS
} interrupt_id;

/* Event timer structure - keeps next timer to occur in structure so don't need
 * to check all entries */

enum {
    CYC_INT_NONE,
    CYC_INT_CPU,
    CYC_INT_US,
};

typedef struct
{
    int    type;   /* Type of time (CPU Cycles, microseconds) or NONE for inactive */
    Sint64 time;   /* number of CPU cycles to go until interupt or absolute microsecond timeout until interrupt */
    void (*pFunction)(void);
} INTERRUPTHANDLER;

extern INTERRUPTHANDLER PendingInterrupt;

extern Sint64 nCyclesMainCounter;
extern Sint64 nCyclesOver;

extern int usCheckCycles;

void CycInt_Reset(void);
void CycInt_MemorySnapShot_Capture(bool bSave);
void CycInt_AcknowledgeInterrupt(void);
void CycInt_AddRelativeInterruptCycles(Sint64 CycleTime, interrupt_id Handler);
void CycInt_AddRelativeInterruptUs(Sint64 us, Sint64 usreal, interrupt_id Handler);
void CycInt_AddRelativeInterruptUsCycles(Sint64 us, Sint64 usreal, interrupt_id Handler);
void CycInt_RemovePendingInterrupt(interrupt_id Handler);
bool CycInt_InterruptActive(interrupt_id Handler);
bool CycInt_SetNewInterruptUs(void);

#ifdef __cplusplus
}
#endif

#endif /* ifndef HATARI_CYCINT_H */
