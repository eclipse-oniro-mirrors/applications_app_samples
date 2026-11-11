import { ExperimentSeriesPanel } from '../../../main/ets/components/ExperimentSeriesPanel';
import { SeriesPanelView } from '../../../main/ets/core/SeriesPresentation';
import { SeriesUiQaFixture, mountSeriesUiQa } from '../support/SeriesUiQaSupport';

/** A host for the exact production panel, not a second implementation of its UI. */
@Entry({ useSharedStorage: true })
@Component
struct SeriesUiQaHarness {
  @LocalStorageProp('qaScenario') scenario: string = 'empty';
  @State view: SeriesPanelView = new SeriesPanelView();
  @State ready: boolean = false;
  @State failure: string = '';
  private generation: number = 0;
  private fixture: SeriesUiQaFixture | undefined = undefined;
  private subscription: number = -1;

  aboutToAppear(): void {
    const fixture = mountSeriesUiQa(this.scenario);
    this.fixture = fixture;
    this.subscription = fixture.service.subscribe((): void => { this.refresh(); });
    const generation = ++this.generation;
    fixture.initialize(this.scenario).then((): void => {
      if (generation !== this.generation) { fixture.dispose(); return; }
      this.refresh(); this.ready = true;
    }).catch((error: Error): void => {
      if (generation === this.generation) { this.failure = error.message; }
    });
  }

  aboutToDisappear(): void {
    this.generation++;
    const fixture = this.fixture;
    if (fixture !== undefined) {
      fixture.service.unsubscribe(this.subscription);
      fixture.dispose();
    }
    this.fixture = undefined;
  }

  private refresh(): void {
    const fixture = this.fixture;
    if (fixture !== undefined) { this.view = fixture.view(); }
  }

  build(): void {
    Scroll() {
      Column({ space: 8 }) {
        if (this.ready) {
          Text('系列隔离入口已就绪').id('series-qa-ready').fontSize(12)
          ExperimentSeriesPanel({
            view: this.view,
            onCountChange: (count: number): void => {
              const fixture = this.fixture;
              if (fixture !== undefined) { fixture.requestedCount = count; this.refresh(); }
            },
            onStart: (): void => {
              const fixture = this.fixture;
              if (fixture !== undefined) { fixture.start(); this.refresh(); }
            },
            onStopAfterCurrent: (): void => {
              const fixture = this.fixture;
              if (fixture !== undefined) { fixture.stop(); this.refresh(); }
            },
            onCancelNow: (): void => {
              const fixture = this.fixture;
              if (fixture !== undefined) { fixture.cancel(); this.refresh(); }
            },
            onCopyReport: (): void => {
              const fixture = this.fixture;
              if (fixture !== undefined) { fixture.copy().then((): void => { this.refresh(); }); }
            }
          })
        } else if (this.failure.length > 0) {
          Text(this.failure).id('series-qa-initialization-error')
        }
      }.width('100%').padding(8)
    }.id('series-qa-scroll').width('100%').height('100%')
  }
}
