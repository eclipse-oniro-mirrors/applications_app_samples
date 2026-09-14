export interface RedirectorConfig {
  groupId: number;
  priority: number;
  packetCopyLen: number;
  nfqueueMaxlen: number;
  nfqueueFlags: number;
}

export interface IPAddress {
  family: number;
  addr: string;
}

export interface IPMatch {
  type: number;
  invert: boolean;
  value?: IPMatchValue;
}

export interface IPMatchValue {
  single?: IPAddress;
  cidr?: {
    base: IPAddress;
    prefixLen: number;
  };
  range?: {
    start: IPAddress;
    end: IPAddress;
  };
  multi?: {
    ipCount: number;
    ips: IPAddress[];
  };
}

export interface PortMatch {
  type: number;
  invert: boolean;
  value?: PortMatchValue;
}

export interface PortMatchValue {
  single?: number;
  range?: {
    startPort: number;
    endPort: number;
  };
  multi?: {
    portCount: number;
    ports: number[];
  };
}

export interface InterfaceMatch {
  enabled: boolean;
  invert: boolean;
  isPrefix: boolean;
  ifName: string;
}

export interface RedirectRule {
  priority: number;
  hookPoint: number;
  protocol: number;
  srcIp: IPMatch;
  srcPort: PortMatch;
  dstIp: IPMatch;
  dstPort: PortMatch;
  inInterface: InterfaceMatch;
  outInterface: InterfaceMatch;
  uidStart: number;
  uidEnd: number;
  proxyIp: IPAddress;
  proxyPort: number;
}

export const createRedirector: (
  groupId: number,
  priority: number,
  packetCopyLen: number,
  nfqueueMaxlen: number,
  nfqueueFlags: number
) => string;

export const destroyRedirector: () => string;

export const addRedirectRule: (ruleJson: string) => string;

export const clearRedirectRule: () => string;

export const getRuleTemplate: (templateType: string) => string;

export interface ProcessInfo {
  pid: number;
  uid: number;
}

export const queryProcess: (
  srcIp: string,
  srcPort: number,
  dstIp: string,
  dstPort: number,
  protocol: number
) => string;
