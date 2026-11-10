import { AutoStartupApi, NativeStatusSnapshot, QueryClock, SystemQueryClock, systemAutoStartupApi, elapsedNow } from '../AutoStartupRuntime';
import { AutoStartupProbePort, CapabilityDiagnostic } from './CapabilityProbe';

/** The two independent entries call exactly the two public query APIs. */
export class RuntimeProbePort implements AutoStartupProbePort {
  private api: AutoStartupApi;
  constructor(api: AutoStartupApi = systemAutoStartupApi) {
    this.api = api;
  }
  async isSupported(): Promise<boolean> { return this.api.isAutoStartupSupported(); }
  isEnabledForSelf(): Promise<boolean> { return this.api.getAutoStartupStatusForSelf(); }
  nativeStatus(): NativeStatusSnapshot {
    return this.api.nativeStatus === undefined ? new NativeStatusSnapshot() : this.api.nativeStatus();
  }
}
const diagnosticClock: QueryClock = new SystemQueryClock();
export const capabilityDiagnostic: CapabilityDiagnostic = new CapabilityDiagnostic(new RuntimeProbePort(),
  (): number => elapsedNow(diagnosticClock), 3000, diagnosticClock);
