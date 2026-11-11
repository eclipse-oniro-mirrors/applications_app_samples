export class EvictionResult {
  public status: string = 'not-dispatched';
  public dispatched: boolean = false;
  public inFlight: boolean = false;
  public code: number = -1;
  public recordId: number = 0;
}

export interface CallRecord {
  id: number;
  api: string;
  target: string;
  status: string;
  kind: string;
  at: number;
  elapsed: number;
  code: number;
  message: string;
  late: boolean;
}

export function emptyCallRecord(): CallRecord {
  return {
    id: 0,
    api: '',
    target: '',
    status: '',
    kind: 'pending',
    at: 0,
    elapsed: 0,
    code: 0,
    message: '',
    late: false
  };
}

export interface LaunchSample {
  id: string;
  group: string;
  at: number;
  contentMs: number;
  device: string;
  appVersion: string;
}

export class MaintenanceStep {
  public key: string = '';
  public label: string = '';
  public status: string = '待执行';
  public detail: string = '';
  public elapsed: number = 0;

  clone(): MaintenanceStep {
    const copy: MaintenanceStep = new MaintenanceStep();
    copy.key = this.key;
    copy.label = this.label;
    copy.status = this.status;
    copy.detail = this.detail;
    copy.elapsed = this.elapsed;
    return copy;
  }
}

export class MaintenanceFlow {
  public id: number = 0;
  public mode: string = 'files';
  public status: string = '未运行';
  public startedAt: number = 0;
  public endedAt: number = 0;
  public steps: MaintenanceStep[] = [];
  public notice: string = '';
  public integrity: string = '未校验';
  public beforeBytes: number = 0;
  public afterBytes: number = 0;
  public digestBefore: string = '';
  public digestAfter: string = '';
  public condition: string = '';

  clone(): MaintenanceFlow {
    const copy: MaintenanceFlow = new MaintenanceFlow();
    copy.id = this.id;
    copy.mode = this.mode;
    copy.status = this.status;
    copy.startedAt = this.startedAt;
    copy.endedAt = this.endedAt;
    copy.steps = this.steps.map((step: MaintenanceStep): MaintenanceStep => step.clone());
    copy.notice = this.notice;
    copy.integrity = this.integrity;
    copy.beforeBytes = this.beforeBytes;
    copy.afterBytes = this.afterBytes;
    copy.digestBefore = this.digestBefore;
    copy.digestAfter = this.digestAfter;
    copy.condition = this.condition;
    return copy;
  }
}

export interface AppState {
  deviceText: string;
  foreground: boolean;
  files: string[];
  modules: string[];
  targetMessage: string;
  configText: string;
  configStatus: string;
  configTargets: string[];
  maintenance: MaintenanceFlow | undefined;
  maintenanceBusy: boolean;
  memoryBusy: boolean;
  resourceBusy: boolean;
  resourceText: string;
  latestMemory: CallRecord | undefined;
  snapFlag: string;
  snapAt: number;
  rebuildAt: number;
  rebuildWaitSeconds: number;
  logs: CallRecord[];
  launches: LaunchSample[];
  storageMessage: string;
  notice: string;
}

export function emptyAppState(): AppState {
  return {
    deviceText: '',
    foreground: true,
    files: [],
    modules: [],
    targetMessage: '',
    configText: '',
    configStatus: '',
    configTargets: [],
    maintenance: undefined,
    maintenanceBusy: false,
    memoryBusy: false,
    resourceBusy: false,
    resourceText: '待读取',
    latestMemory: undefined,
    snapFlag: '尚未设置',
    snapAt: 0,
    rebuildAt: 0,
    rebuildWaitSeconds: 0,
    logs: [],
    launches: [],
    storageMessage: '',
    notice: ''
  };
}

export function formatTime(value: number): string {
  if (value <= 0) {
    return '—';
  }
  const time = new Date(value);
  const pad = (part: number): string => part.toString().padStart(2, '0');
  return `${time.getFullYear()}-${pad(time.getMonth() + 1)}-${pad(time.getDate())} ` +
    `${pad(time.getHours())}:${pad(time.getMinutes())}:${pad(time.getSeconds())}`;
}
