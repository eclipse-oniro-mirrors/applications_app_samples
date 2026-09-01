import napi from 'libentry.so';

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

export enum PacketCallback {
  Accept = 0,
  Reject = 1
}

export enum PacketCopyMode {
  COPY_MODE_META = 0,
  COPY_MODE_HEADER = 1,
  COPY_MODE_FULL = 2,
  COPY_MODE_MAXLEN = 3
}

export interface IPAddress extends napi.IPAddress {
}

export interface IPCidrValue extends napi.IPCidrValue {
}

export interface IPRangeValue extends napi.IPRangeValue {
}

export interface IPMultiValue extends napi.IPMultiValue {
}

export interface IPMatch extends napi.IPMatch {
}

export interface PortRange extends napi.PortRange {
}

export interface PortMulti extends napi.PortMulti {
}

export interface PortMatch extends napi.PortMatch {
}

export interface InterfaceMatch extends napi.InterfaceMatch {
}

export interface MacMatch extends napi.MacMatch {
}

export interface TcpFlagsMatch extends napi.TcpFlagsMatch {
}

export interface ConntrackMatch extends napi.ConntrackMatch {
}

export interface RuleConfig extends napi.RuleConfig {
}

export interface createPacketInfo extends napi.createPacketInfo {
}

export interface Packet {
  packetId: number;
  protocol: number;
  srcIp: IPAddress;
  srcPort: number;
  dstIp: IPAddress;
  dstPort: number;
  packetLen: number;
  userData: string;
}

export interface IPacketFilter {
  createPacketController: (
    groupId: number,
    priority: number,
    packetCopyLen: number,
    nfqueueMaxlen: number,
    nfqueueFlags: number,
    packetCopyMode: PacketCopyMode
  ) => createPacketInfo;

  destroyPacketController(id: number): number;

  addPacketRule(id: number, rule: RuleConfig): number;

  clearPacketRule: (id: number) => number;

  registerPacketCallback(
    id: number,
    userData: string,
    callback: (packet: Packet, userData: string) => PacketCallback
  ): number;

  unregisterPacketCallback(id: number): void;
}

export function buildIPAddress(
  family: IPFamily = IPFamily.IP_FAMILY_V4,
  addr: number[] = [0,0,0,0]
): IPAddress {
  return { family, addr };
}

export function buildIPMatch(
  type: IPMatchType = IPMatchType.IP_MATCH_ANY,
  invert: boolean = false
): IPMatch {
  const m: IPMatch = { type, invert };
  switch (type) {
    case IPMatchType.IP_MATCH_SINGLE:
      m.value = buildIPAddress();
      break;
    case IPMatchType.IP_MATCH_CIDR:
      m.value = { base: buildIPAddress(), prefixLen: 0 } as IPCidrValue;
      break;
    case IPMatchType.IP_MATCH_RANGE:
      m.value = { start: buildIPAddress(), end: buildIPAddress() } as IPRangeValue;
      break;
    case IPMatchType.IP_MATCH_MULTI:
      m.value = { ips: [buildIPAddress()] } as IPMultiValue;
      break;
    default:
      break;
  }
  return m;
}

export function buildPortMatch(
  type: PortMatchType = PortMatchType.PORT_MATCH_ANY,
  invert: boolean = false
): PortMatch {
  const m: PortMatch = { type, invert };
  switch (type) {
    case PortMatchType.PORT_MATCH_SINGLE:
      m.value = 0;
      break;
    case PortMatchType.PORT_MATCH_RANGE:
      m.value = { startPort: 0, endPort: 65535 } as PortRange;
      break;
    case PortMatchType.PORT_MATCH_MULTI:
      m.value = { ports: [0] } as PortMulti;
      break;
    default:
      break;
  }
  return m;
}

export function buildInterfaceMatch(enabled: boolean = false): InterfaceMatch {
  return { enabled, invert: false, isPrefix: false, ifName: '' };
}

export function buildRuleConfig(): RuleConfig {
  return {
    priority: 0,
    hookPoint: HookPoint.HOOK_INPUT,
    protocol: 6,
    srcIp: buildIPMatch(),
    srcPort: buildPortMatch(),
    dstIp: buildIPMatch(),
    dstPort: buildPortMatch(),
    inInterface: buildInterfaceMatch(),
    outInterface: buildInterfaceMatch(),
    uidStart: 0,
    uidEnd: 0,
    macMatch: { enable: false, invert: false, srcMac: ['0.0.0.0'] },
    tcpFlagsMatch: { enable: false, flagMask: 0, flagComp: 0 },
    conntrackMatch: { enable: false, stateMask: 0 },
  };
}

export function errCodeName(code: number): string {
  switch (code) {
    case ErrCode.OK:
      return 'OK';
    case ErrCode.ERROR_PERMISSION_DENIED:
      return 'PERMISSION_DENIED';
    case ErrCode.ERROR_INVALID_PARAM:
      return 'INVALID_PARAM';
    case ErrCode.ERROR_NOT_FOUND:
      return 'NOT_FOUND';
    case ErrCode.ERROR_TOO_MANY_RULES:
      return 'TOO_MANY_RULES';
    case ErrCode.ERROR_GROUP_ID_IN_USE:
      return 'GROUP_ID_IN_USE';
    case ErrCode.ERROR_NFQUEUE_ERROR:
      return 'NFQUEUE_ERROR';
    default:
      return `UNKNOWN(${code})`;
  }
}
