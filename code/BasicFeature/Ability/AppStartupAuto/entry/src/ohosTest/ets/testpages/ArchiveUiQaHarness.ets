import { StartupArchivePanel } from '../../../main/ets/components/StartupArchivePanel';
import { ArchiveUiQaFixture, mountArchiveUiQa } from '../support/ArchiveUiQaSupport';

@Entry({ useSharedStorage: true })
@Component
struct ArchiveUiQaHarness {
  @LocalStorageProp('qaScenario') scenario: string = 'empty';
  @State ready: boolean = false;
  @State failure: string = '';
  private fixture: ArchiveUiQaFixture | undefined = undefined;
  private generation: number = 0;

  aboutToAppear(): void {
    const generation = ++this.generation;
    mountArchiveUiQa(this.scenario).then((fixture: ArchiveUiQaFixture): void => {
      if (generation !== this.generation) { void fixture.dispose(); return; }
      this.fixture = fixture;
      this.ready = true;
    }).catch((error: Error): void => { if (generation === this.generation) { this.failure = error.message; } });
  }

  aboutToDisappear(): void {
    this.generation++;
    const fixture = this.fixture;
    if (fixture !== undefined) { void fixture.dispose(); }
    this.fixture = undefined;
  }

  build(): void {
    Scroll() {
      Column({ space: 8 }) {
        if (this.ready && this.fixture !== undefined) {
          Text('查询归档隔离入口已就绪').id('archive-qa-ready').fontSize(12)
          StartupArchivePanel({ repository: this.fixture.repository,
            liveRecords: this.fixture.liveRecords, clipboard: this.fixture.clipboard })
        } else if (this.failure.length > 0) {
          Text(this.failure).id('archive-qa-initialization-error')
        }
      }.width('100%').padding(8)
    }.id('archive-qa-scroll').width('100%').height('100%')
  }
}
