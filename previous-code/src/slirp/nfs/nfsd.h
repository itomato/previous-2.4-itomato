#ifndef _NFSD_H_
#define _NFSD_H_

#include <stdint.h>
#include <unistd.h>
#include "ctl.h"

#include "RPCProg.h"

#define PORT_DNS      53
#define PORT_PORTMAP  111
#define PORT_NFS      2049
#define PORT_NETINFO  1043

enum {
    PROG_PORTMAP     = 100000,
    PROG_NFS         = 100003,
    PROG_MOUNT       = 100005,
    PROG_BOOTPARAM   = 100026,
    PROG_NETINFO     = 200100000,
    PROG_NETINFOBIND = 200100001,
    PROG_VDNS        = 200053, // virtual DNS
};

extern char nfsd_hostname[_SC_HOST_NAME_MAX];

#ifdef __cplusplus
extern "C" {

    class  FileTableNFSD;
    extern FileTableNFSD* nfsd_fts[1]; // to be extended for multiple exports

#endif
    
    void nfsd_start(void);
    int  nfsd_match_addr(uint32_t addr);

#ifdef __cplusplus
}
#else
    int  nfsd_read(const char* path, size_t fileOffset, void* dst, size_t count);
    void nfsd_udp_map_to_local_port(uint32_t* ip, uint16_t* dport);
    void udp_map_from_local_port(uint16_t port, uint32_t* saddrNBO, uint16_t* sin_portNBO);
    void nfsd_tcp_map_to_local_port(uint16_t port, uint32_t* saddrNBO, uint16_t* sin_portNBO);
#endif

#define NFSD_NOTIMPL nfsd_not_implemented(__FILE__, __LINE__);

#endif
