import { SceneWorkspaceBackup } from '../../../main/ets/components/SceneWorkspaceBackup';
import { WorkspaceBackupUiQaFixture, mountWorkspaceBackupUiQa } from '../support/WorkspaceBackupUiQaSupport';

@Entry({ useSharedStorage: true })
@Component
struct WorkspaceBackupUiQaHarness {
  @LocalStorageProp('qaScenario') scenario: string = 'empty';
  @State ready: boolean = false;
  private fixture: WorkspaceBackupUiQaFixture | undefined = undefined;

  aboutToAppear(): void {
    this.fixture = mountWorkspaceBackupUiQa(this.scenario);
    this.ready = true;
  }

  aboutToDisappear(): void {
    const fixture = this.fixture;
    if (fixture !== undefined) { fixture.release(); }
    this.fixture = undefined;
  }

  build(): void {
    Scroll() {
      Column({ space: 8 }) {
        if (this.ready && this.fixture !== undefined) {
          Text('本地工作区隔离入口已就绪').id('backup-qa-ready').fontSize(12)
          SceneWorkspaceBackup({ controller: this.fixture.controller })
        }
      }.width('100%').padding(8)
    }.id('backup-qa-scroll').width('100%').height('100%')
  }
}
