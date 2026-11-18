export enum IPMatchType {
  IP_MATCH_ANY = 0,
  IP_MATCH_SINGLE = 1,
  IP_MATCH_CIDR = 2,
  IP_MATCH_RANGE = 3,
  IP_MATCH_MULTI = 4
}

export enum IPFamily {
  IP_FAMILY_UNSPEC = 0,
  IP_FAMILY_V4 = 1,
  IP_FAMILY_V6 = 2
}

export enum PortMatchType {
  PORT_MATCH_ANY = 0,
  PORT_MATCH_SINGLE = 1,
  PORT_MATCH_RANGE = 2,
  PORT_MATCH_MULTI = 3
}

export enum HookPoint {
  HOOK_INPUT = 0,
  HOOK_OUTPUT = 1,
  HOOK_FORWARD = 2,
  HOOK_PREROUTING = 3,
  HOOK_POSTROUTING = 4
}

export enum ErrCode {
  OK = 0,
  ERROR_PERMISSION_DENIED = 201,
  ERROR_INVALID_PARAM = 29410101,
  ERROR_NOT_FOUND = 29410102,
  ERROR_TOO_MANY_RULES = 29410103,
  ERROR_GROUP_ID_IN_USE = 29410104,
  ERROR_NFQUEUE_ERROR = 29410105
}

export enum FlagMask {
  OH_TRAFFICFILTER_TCP_FLAG_SYN = 0x01,
  OH_TRAFFICFILTER_TCP_FLAG_ACK = 0x02,
  OH_TRAFFICFILTER_TCP_FLAG_FIN = 0x04,
  OH_TRAFFICFILTER_TCP_FLAG_RST = 0x08,
  OH_TRAFFICFILTER_TCP_FLAG_PSH = 0x10,
  OH_TRAFFICFILTER_TCP_FLAG_URG = 0x20,
  OH_TRAFFICFILTER_TCP_FLAG_ALL = 0x3F,
  OH_TRAFFICFILTER_TCP_FLAG_NONE = 0x00
}

export enum StateMask {
  OH_TRAFFICFILTER_CT_STATE_ANY = 0x00,
  OH_TRAFFICFILTER_CT_STATE_NEW = 0x01,
  OH_TRAFFICFILTER_CT_STATE_ESTABLISHED = 0x02,
  OH_TRAFFICFILTER_CT_STATE_RELATED = 0x04,
  OH_TRAFFICFILTER_CT_STATE_INVALID = 0x08,
  OH_TRAFFICFILTER_CT_STATE_UNTRACKED = 0x10,
}

export enum packetCallback {
  Accept = 0,
  Reject = 1
}

export enum PacketCopyMode {
  COPY_MODE_META = 0,
  COPY_MODE_HEADER = 1,
  COPY_MODE_FULL = 2,
  COPY_MODE_MAXLEN = 3
}

export interface IPAddress {
  family: IPFamily;
  addr: number[];
}

export interface IPCidrValue {
  base: IPAddress;
  prefixLen: number;
}

export interface IPRangeValue {
  start: IPAddress;
  end: IPAddress;
}

export interface IPMultiValue {
  ips: IPAddress[];
}

export interface IPMatch {
  type: IPMatchType;
  invert: boolean;
  value?: Object;
}

export interface PortRange {
  startPort: number;
  endPort: number;
}

export interface PortMulti {
  ports: number[];
}

export interface PortMatch {
  type: PortMatchType;
  invert: boolean;
  value?: Object;
}

export interface InterfaceMatch {
  enabled: boolean;
  invert: boolean;
  isPrefix: boolean;
  ifName: string;
}

export interface MacMatch {
  enable: boolean;
  invert: boolean;
  srcMac: string[];
}

export interface TcpFlagsMatch {
  enable: boolean;
  flagMask: FlagMask;
  flagComp: number;
}

export interface ConntrackMatch {
  enable: boolean;
  stateMask: StateMask;
}

export interface RuleConfig {
  priority: number;
  hookPoint: HookPoint;
  protocol: number;
  srcIp: IPMatch;
  srcPort: PortMatch;
  dstIp: IPMatch;
  dstPort: PortMatch;
  inInterface: InterfaceMatch;
  outInterface: InterfaceMatch;
  uidStart: number;
  uidEnd: number;
  macMatch?: MacMatch;
  tcpFlagsMatch?: TcpFlagsMatch;
  conntrackMatch?: ConntrackMatch;
}

export interface Packet {
  packetId: number;
  protocol: number;
  srcIp: IPAddress;
  srcPort: number;
  dstIp: IPAddress;
  dstPort: number;
  packetLen: number;
  user_data: string;
}

export interface createPacketInfo {
  id: number;
  ret: number;
}

export const createPacketController: (
  groupId: number,
  priority: number,
  packetCopyLen: number,
  nfqueueMaxlen: number,
  nfqueueFlags: number,
  packetCopyMode: PacketCopyMode
) => createPacketInfo;
export const destroyPacketController: (id: number) => number;
export const addPacketRule: (id: number, rule: RuleConfig) => number;
export const clearPacketRule: (id: number) => number;
export const registerPacketCallback: (
  id: number,
  user_data: string,
  callback: (packet: Packet, user_data: string) => packetCallback
) => number;
export const unregisterPacketCallback: (id: number) => number;
