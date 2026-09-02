import {
  ConntrackMatch,
  FlagMask,
  HookPoint,
  InterfaceMatch,
  IPAddress, IPCidrValue, IPFamily, IPMatch, IPMatchType, IPMultiValue, IPRangeValue,
  MacMatch,
  PortMatch,
  PortMatchType,
  PortMulti,
  PortRange,
  RuleConfig,
  StateMask,
  PacketCopyMode,
  TcpFlagsMatch, buildRuleConfig} from '../types/packetFilter';

@ObservedV2
export class IPAddressForm {
  @Trace public family: IPFamily = IPFamily.IP_FAMILY_V4;
  @Trace public text: string = '192.168.43.4';

  toIPAddress(): IPAddress {
    if (this.family === IPFamily.IP_FAMILY_V6) {

      const parts = this.text.split(':').filter(s => s.length > 0).map(s=>Number(s));
      return { family: this.family, addr: parts.length > 0 ? parts : [] };
    }
    const parts = this.text.split('.').filter(s => s.length > 0).map(s=>Number(s));
    return { family: this.family, addr: parts.length===4?parts:[0,0,0,0] };
  }
}

@ObservedV2
export class IPMatchForm {
  @Trace public type: IPMatchType = IPMatchType.IP_MATCH_ANY;
  @Trace public invert: boolean = false;

  @Trace public single: IPAddressForm = new IPAddressForm();

  @Trace public cidrBase: IPAddressForm = new IPAddressForm();
  @Trace public cidrPrefix: number = 24;

  @Trace public rangeStart: IPAddressForm = new IPAddressForm();
  @Trace public rangeEnd: IPAddressForm = new IPAddressForm();

  @Trace public multiText: string = '192.168.43.4';

  toIPMatch(): IPMatch {
    const m: IPMatch = { type: this.type, invert: this.invert };
    switch (this.type) {
      case IPMatchType.IP_MATCH_SINGLE:
        m.value = this.single.toIPAddress();
        break;
      case IPMatchType.IP_MATCH_CIDR:
        m.value = {
          base: this.cidrBase.toIPAddress(),
          prefixLen: this.cidrPrefix
        } as IPCidrValue;
        break;
      case IPMatchType.IP_MATCH_RANGE:
        m.value = {
          start: this.rangeStart.toIPAddress(),
          end: this.rangeEnd.toIPAddress()
        } as IPRangeValue;
        break;
      case IPMatchType.IP_MATCH_MULTI: {
        const lines = this.multiText.split(/[\n,]/).map(s => s.trim()).filter(s => s.length > 0);
        const ips: IPAddress[] = lines.map(t => {
          const f = new IPAddressForm();
          f.text = t;
          return f.toIPAddress();
        });
        m.value = { ips: ips.length > 0 ? ips : [new IPAddressForm().toIPAddress()] } as IPMultiValue;
        break;
      }
      default:
        break;
    }
    return m;
  }
}

@ObservedV2
export class PortMatchForm {
  @Trace public type: PortMatchType = PortMatchType.PORT_MATCH_ANY;
  @Trace public invert: boolean = false;

  @Trace public single: number = 80;

  @Trace public rangeStart: number = 1024;
  @Trace public rangeEnd: number = 65535;

  @Trace public multiText: string = '80,443';

  toPortMatch(): PortMatch {
    const m: PortMatch = { type: this.type, invert: this.invert };
    switch (this.type) {
      case PortMatchType.PORT_MATCH_SINGLE:
        m.value = this.single;
        break;
      case PortMatchType.PORT_MATCH_RANGE:
        m.value = { startPort: this.rangeStart, endPort: this.rangeEnd } as PortRange;
        break;
      case PortMatchType.PORT_MATCH_MULTI: {
        const ports = this.multiText.split(',')
          .map(s => parseInt(s.trim(), 10))
          .filter(n => !isNaN(n));
        m.value = { ports: ports.length > 0 ? ports : [0] } as PortMulti;
        break;
      }
      default:
        break;
    }
    return m;
  }
}

@ObservedV2
export class InterfaceMatchForm {
  @Trace public enabled: boolean = false;
  @Trace public invert: boolean = false;
  @Trace public isPrefix: boolean = false;
  @Trace public ifName: string = '';

  toInterfaceMatch(): InterfaceMatch {
    return {
      enabled: this.enabled,
      invert: this.invert,
      isPrefix: this.isPrefix,
      ifName: this.ifName
    };
  }
}

@ObservedV2
export class TcpFlagsMatchForm {
  @Trace public enable: boolean = false;
  @Trace public flagMask: FlagMask = FlagMask.OH_TRAFFICFILTER_TCP_FLAG_SYN;
  @Trace public flagComp: number = 0;

  toTcpFlagsMatch(): TcpFlagsMatch {
    return {
      enable: this.enable,
      flagMask: this.flagMask,
      flagComp: this.flagComp
    };
  }
}

@ObservedV2
export class ConntrackMatchForm {
  @Trace public enable: boolean = false;
  @Trace public stateMask: StateMask = StateMask.OH_TRAFFICFILTER_CT_STATE_ANY;

  toConntrackMatch(): ConntrackMatch {
    return {
      enable: this.enable,
      stateMask: this.stateMask
    };
  }
}

@ObservedV2
export class MacMatchForm {
  @Trace public enable: boolean = false;
  @Trace public invert: boolean = false;
  @Trace public macText: string = '00:00:00:00:00:00';

  toMacMatch(): MacMatch {
    const macs = this.macText.split(/[,\n]/).map(s => s.trim()).filter(s => s.length > 0);
    return {
      enable: this.enable,
      invert: this.invert,
      srcMac: macs.length > 0 ? macs : ['00:00:00:00:00:00']
    };
  }
}

@ObservedV2
export class RuleFormModel {
  @Trace public priority: number = 1;
  @Trace public hookPoint: HookPoint = HookPoint.HOOK_INPUT;
  @Trace public protocol: number = 6;
  @Trace public srcIp: IPMatchForm = new IPMatchForm();
  @Trace public srcPort: PortMatchForm = new PortMatchForm();
  @Trace public dstIp: IPMatchForm = new IPMatchForm();
  @Trace public dstPort: PortMatchForm = new PortMatchForm();
  @Trace public inInterface: InterfaceMatchForm = new InterfaceMatchForm();
  @Trace public outInterface: InterfaceMatchForm = new InterfaceMatchForm();
  @Trace public uidStart: number = 0;
  @Trace public uidEnd: number = 0;
  @Trace public proxyIp: IPAddressForm = new IPAddressForm();
  @Trace public proxyPort: number = 8080;
  @Trace public tcpFlagsMatch: TcpFlagsMatchForm = new TcpFlagsMatchForm();
  @Trace public conntrackMatch: ConntrackMatchForm = new ConntrackMatchForm();
  @Trace public macMatch: MacMatchForm = new MacMatchForm();

  toRuleConfig(): RuleConfig {
    return {
      priority: this.priority,
      hookPoint: this.hookPoint,
      protocol: this.protocol,
      srcIp: this.srcIp.toIPMatch(),
      srcPort: this.srcPort.toPortMatch(),
      dstIp: this.dstIp.toIPMatch(),
      dstPort: this.dstPort.toPortMatch(),
      inInterface: this.inInterface.toInterfaceMatch(),
      outInterface: this.outInterface.toInterfaceMatch(),
      uidStart: this.uidStart,
      uidEnd: this.uidEnd,
      macMatch: this.macMatch.toMacMatch(),
      tcpFlagsMatch: this.tcpFlagsMatch.toTcpFlagsMatch(),
      conntrackMatch: this.conntrackMatch.toConntrackMatch(),
    };
  }

  reset(): void {
    const d = buildRuleConfig();
    this.priority = d.priority;
    this.hookPoint = d.hookPoint;
    this.protocol = d.protocol;
    this.srcIp = new IPMatchForm();
    this.srcPort = new PortMatchForm();
    this.dstIp = new IPMatchForm();
    this.dstPort = new PortMatchForm();
    this.inInterface = new InterfaceMatchForm();
    this.outInterface = new InterfaceMatchForm();
    this.uidStart = d.uidStart;
    this.uidEnd = d.uidEnd;
    this.tcpFlagsMatch = new TcpFlagsMatchForm();
    this.conntrackMatch = new ConntrackMatchForm();
    this.macMatch = new MacMatchForm();
  }
}

export interface SelectOptionItem<T> {
  label: string;
  value: T;
}

export const IP_MATCH_TYPE_OPTIONS: SelectOptionItem<IPMatchType>[] = [
  { label: 'ANY (0)', value: IPMatchType.IP_MATCH_ANY },
  { label: 'SINGLE (1)', value: IPMatchType.IP_MATCH_SINGLE },
  { label: 'CIDR (2)', value: IPMatchType.IP_MATCH_CIDR },
  { label: 'RANGE (3)', value: IPMatchType.IP_MATCH_RANGE },
  { label: 'MULTI (4)', value: IPMatchType.IP_MATCH_MULTI }
];

export const PORT_MATCH_TYPE_OPTIONS: SelectOptionItem<PortMatchType>[] = [
  { label: 'ANY (0)', value: PortMatchType.PORT_MATCH_ANY },
  { label: 'SINGLE (1)', value: PortMatchType.PORT_MATCH_SINGLE },
  { label: 'RANGE (2)', value: PortMatchType.PORT_MATCH_RANGE },
  { label: 'MULTI (3)', value: PortMatchType.PORT_MATCH_MULTI }
];

export const IP_FAMILY_OPTIONS: SelectOptionItem<IPFamily>[] = [
  { label: 'UNSPEC (0)', value: IPFamily.IP_FAMILY_UNSPEC },
  { label: 'V4 (1)', value: IPFamily.IP_FAMILY_V4 },
  { label: 'V6 (2)', value: IPFamily.IP_FAMILY_V6 }
];

export const HOOK_POINT_OPTIONS: SelectOptionItem<HookPoint>[] = [
  { label: 'INPUT (0)', value: HookPoint.HOOK_INPUT },
  { label: 'OUTPUT (1)', value: HookPoint.HOOK_OUTPUT },
  { label: 'FORWARD (2)', value: HookPoint.HOOK_FORWARD },
  { label: 'PREROUTING (3)', value: HookPoint.HOOK_PREROUTING },
  { label: 'POSTROUTING (4)', value: HookPoint.HOOK_POSTROUTING }
];

export const PROTOCOL_OPTIONS: SelectOptionItem<number>[] = [
  { label: 'ANY (0)', value: 0 },
  { label: 'TCP (6)', value: 6 },
  { label: 'UDP (17)', value: 17 },
];

export const FLAG_MASK_OPTIONS: SelectOptionItem<number>[] = [
  { label: 'NONE (0x00)', value: FlagMask.OH_TRAFFICFILTER_TCP_FLAG_NONE },
  { label: 'SYN (0x01)', value: FlagMask.OH_TRAFFICFILTER_TCP_FLAG_SYN },
  { label: 'ACK (0x02)', value: FlagMask.OH_TRAFFICFILTER_TCP_FLAG_ACK },
  { label: 'FIN (0x04)', value: FlagMask.OH_TRAFFICFILTER_TCP_FLAG_FIN },
  { label: 'RST (0x08)', value: FlagMask.OH_TRAFFICFILTER_TCP_FLAG_RST },
  { label: 'PSH (0x10)', value: FlagMask.OH_TRAFFICFILTER_TCP_FLAG_PSH },
  { label: 'URG (0x20)', value: FlagMask.OH_TRAFFICFILTER_TCP_FLAG_URG },
  { label: 'ALL (0x3F)', value: FlagMask.OH_TRAFFICFILTER_TCP_FLAG_ALL },
];

export const STATE_MASK_OPTIONS: SelectOptionItem<number>[] = [
  { label: 'ANY (0x00)', value: StateMask.OH_TRAFFICFILTER_CT_STATE_ANY },
  { label: 'NEW (0x01)', value: StateMask.OH_TRAFFICFILTER_CT_STATE_NEW },
  { label: 'ESTABLISHED (0x02)', value: StateMask.OH_TRAFFICFILTER_CT_STATE_ESTABLISHED },
  { label: 'RELATED (0x04)', value: StateMask.OH_TRAFFICFILTER_CT_STATE_RELATED },
  { label: 'INVALID (0x08)', value: StateMask.OH_TRAFFICFILTER_CT_STATE_INVALID },
  { label: 'UNTRACKED (0x10)', value: StateMask.OH_TRAFFICFILTER_CT_STATE_UNTRACKED },
];

export const PACKET_COPY_MODE_OPTIONS: SelectOptionItem<number>[] = [
  { label: 'COPY_MODE_META', value: PacketCopyMode.COPY_MODE_META },
  { label: 'COPY_MODE_HEADER', value: PacketCopyMode.COPY_MODE_HEADER },
  { label: 'COPY_MODE_FULL', value: PacketCopyMode.COPY_MODE_FULL },
  { label: 'COPY_MODE_MAXLEN', value: PacketCopyMode.COPY_MODE_MAXLEN },
];
