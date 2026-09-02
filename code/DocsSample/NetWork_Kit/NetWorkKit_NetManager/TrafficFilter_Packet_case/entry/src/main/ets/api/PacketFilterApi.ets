import {
  IPacketFilter,
  errCodeName,
  Packet,
  buildIPMatch,
  buildPortMatch,
  ErrCode, PacketCallback, RuleConfig, createPacketInfo,
  PacketCopyMode
} from '../types/packetFilter';
import napi from 'libentry.so';

export interface CallLog {
  seq: number;
  time: string;
  fn: string;
  args: string;
  result: string;
  code: number;
  codeName: string;
}

interface PacketFilterEntry {
  id: number;
  groupId: number;
  priority: number;
  rules: RuleConfig[];
}

interface PacketCallbackEntry {
  userData: string;
  callback: (packet: Packet, userData: string) => void;
}

const MAX_RULES_PER_CONTROLLER = 1024;

export class PacketFilterApi implements IPacketFilter {
  private static instance: PacketFilterApi;
  private nextId: number = 1;
  private controllers: Map<number, PacketFilterEntry> = new Map();
  private callbacks: Map<number, PacketCallbackEntry> = new Map();
  private seq: number = 0;
  public logs: CallLog[] = [];

  private constructor() {
  }

  static getInstance(): PacketFilterApi {
    if (!PacketFilterApi.instance) {
      PacketFilterApi.instance = new PacketFilterApi();
    }
    return PacketFilterApi.instance;
  }

  listIds(): number[] {
    return Array.from(this.controllers.keys()).sort((a, b) => a - b);
  }

  ruleCount(id: number): number {
    const e = this.controllers.get(id);
    return e ? e.rules.length : -1;
  }

  createPacketController(
    groupId: number,
    priority: number,
    packetCopyLen: number,
    nfqueueMaxlen: number,
    nfqueueFlags: number,
    packetCopyMode: PacketCopyMode
  ): createPacketInfo {
    const res = napi.createPacketController(
      groupId,
      priority,
      packetCopyLen,
      nfqueueMaxlen,
      nfqueueFlags,
      packetCopyMode
    );
    const id = res.id;
    if (id > 0 && res.ret === 0) {
      this.controllers.set(id, { id, groupId, priority, rules: [] });
    }
    this.record('createPacketController', `groupId=${groupId}, priority=${priority}`,
      `id=${id}`, res.ret);
    return res;
  }

  destroyPacketController(id: number): number {
    const ret = napi.destroyPacketController(id);
    if(ret === 0){
      this.controllers.delete(id);
      this.callbacks.delete(id);
    }
    this.record('destroyPacketController', `id=${id}`, 'void', ret);
    return ret;
  }

  addPacketRule(id: number, rule: RuleConfig): number {
    const e = this.controllers.get(id);
    const ret = napi.addPacketRule(id, rule);
    e!.rules.push(rule);
    this.record('addPacketRule',
      `id=${id}, hookPoint=${rule.hookPoint}, protocol=${rule.protocol}, priority=${rule.priority}`,
      `void (total=${1})`, ret);
    return ret;
  }

  clearPacketRule(id: number): number {
    const ret = napi.clearPacketRule(id);
    const e = this.controllers.get(id);
    e!.rules = [];
    this.record('clearPacketRule', `id=${id}`, `void (cleared=${1})`, ret);
    return ret;
  }

  registerPacketCallback(
    id: number,
    userData: string,
    callback: (packet: Packet, userData: string) => PacketCallback
  ): number {
    const ret = napi.registerPacketCallback(id, userData, callback);
    this.callbacks.set(id, { userData, callback });
    this.record('registerPacketCallback', `id=${id}, userData=${userData}`,
      'void', ret);

    return ret;
  }

  unregisterPacketCallback(id: number): number {
    const ret = napi.unregisterPacketCallback(id);
    this.callbacks.delete(id);
    this.record('unregisterPacketCallback', `id=${id}`, 'void', ret);
    return ret;
  }

  clearLogs(): void {
    this.logs = [];
    this.notify();
  }

  resetAll(): void {
    this.controllers.clear();
    this.callbacks.clear();
    this.nextId = 1;
    this.logs = [];
    this.seq = 0;
    this.notify();
  }

  private record(fn: string, args: string, result: string, code: ErrCode): void {
    this.seq += 1;
    const log: CallLog = {
      seq: this.seq,
      time: this.now(),
      fn,
      args,
      result,
      code,
      codeName: errCodeName(code)
    };
    this.logs.unshift(log);
    if (this.logs.length > 500) {
      this.logs.length = 500;
    }
    this.notify();
  }

  private now(): string {
    const d = new Date();
    const p = (n: number): string => n < 10 ? `0${n}` : `${n}`;
    return `${p(d.getHours())}:${p(d.getMinutes())}:${p(d.getSeconds())}.${d.getMilliseconds()
      .toString()
      .padStart(3, '0')}`;
  }

  private notify(): void {
    AppStorage.setOrCreate('callLogs', this.logs);
    AppStorage.setOrCreate('controllerIds', this.listIds());
  }

}

export const packetFilterApi = PacketFilterApi.getInstance();
