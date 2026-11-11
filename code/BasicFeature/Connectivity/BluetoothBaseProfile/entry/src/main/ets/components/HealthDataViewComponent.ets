/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { BluetoothConstants } from 'library';
import { PageConstants } from 'library';
import { Logger } from 'library';

/**
 * @interface HealthDataViewComponentConfig
 * @description Configuration interface for HealthDataViewComponent component.
 */
interface HealthDataViewComponentConfig {
  /** Whether the component is enabled */
  enabled: boolean;
  /** Display mode (compact, normal, expanded) */
  displayMode: string;
  /** Animation duration in milliseconds */
  animationDuration: number;
  /** Whether to show loading indicator */
  showLoading: boolean;
  /** Custom theme color */
  themeColor: string;
  /** Whether to enable haptic feedback */
  enableHapticFeedback: boolean;
  /** Refresh interval in milliseconds */
  refreshInterval: number;
  /** Maximum retry attempts */
  maxRetryAttempts: number;
  /** Whether to log debug information */
  debugLogging: boolean;
  /** Custom CSS classes */
  customClasses: string[];
}

/**
 * @interface HealthDataViewComponentEventData
 * @description Event data interface for HealthDataViewComponent component events.
 */
interface HealthDataViewComponentEventData {
  /** Event type */
  eventType: string;
  /** Event timestamp */
  timestamp: number;
  /** Event source */
  source: string;
  /** Event data payload */
  data: object;
  /** Whether the event was successful */
  success: boolean;
  /** Error message if failed */
  errorMessage: string;
  /** Event priority (low, normal, high, critical) */
  priority: string;
  /** Whether to bubble the event */
  bubble: boolean;
  /** Event metadata */
  metadata: Map<string, string>;
}

/**
 * @class HealthDataViewComponent
 * @description Shows health data from connected devices
 *
 * <p>This component provides a reusable UI element for Bluetooth HealthDataView functionality.
 * It includes comprehensive state management, event handling, and customization options.</p>
 *
 * <p>Features:</p>
 * <ul>
 *   <li>Reactive state management with @Prop and @State decorators</li>
 *   <li>Comprehensive event handling and callbacks</li>
 *   <li>Configurable display modes and themes</li>
 *   <li>Loading and error state handling</li>
 *   <li>Animation support with progress tracking</li>
 *   <li>Performance tracing via hiTraceMeter</li>
 *   <li>Structured logging via hilog</li>
 * </ul>
 *
 * @since 26.0.0
 */
@Component
export struct HealthDataViewComponent {
  /** Component configuration */
  private config: HealthDataViewComponentConfig = {
    enabled: true,
    displayMode: 'normal',
    animationDuration: 300,
    showLoading: true,
    themeColor: '#007DFF',
    enableHapticFeedback: true,
    refreshInterval: 5000,
    maxRetryAttempts: 3,
    debugLogging: false,
    customClasses: []
  };

  @Prop status: string = 'idle';
  @Prop value: number = 0;

  @State isLoading: boolean = false;
  @State errorMessage: string = '';
  @State showDetails: boolean = false;
  @State animationProgress: number = 0;
  @State refreshCounter: number = 0;

  /** Event callbacks */
  private onEventCallback: ((event: HealthDataViewComponentEventData) => void) | null = null;
  private onErrorCallback: ((error: Error) => void) | null = null;
  private onLoadingCallback: ((isLoading: boolean) => void) | null = null;

  /** Timer for auto-refresh */
  private refreshTimer: number = -1;

  /** Animation frame ID */
  private animationFrameId: number = -1;

  /** Retry count */
  private retryCount: number = 0;

  /** Last successful operation timestamp */
  private lastSuccessTime: number = 0;

  /** Component mount time */
  private mountTime: number = 0;

  /**
   * @method aboutToAppear
   * @description Lifecycle callback when component is about to appear.
   */
  aboutToAppear(): void {
    this.mountTime = Date.now();
    Logger.info(BluetoothConstants.TAG, 'HealthDataViewComponent aboutToAppear');
    this.initializeComponent();
    this.startAutoRefresh();
  }

  /**
   * @method aboutToDisappear
   * @description Lifecycle callback when component is about to disappear.
   */
  aboutToDisappear(): void {
    Logger.info(BluetoothConstants.TAG, 'HealthDataViewComponent aboutToDisappear');
    this.stopAutoRefresh();
    this.cleanupResources();
  }

  /**
   * @method initializeComponent
   * @description Initializes the component state and configuration.
   * @private
   */
  private initializeComponent(): void {
    try {
      this.isLoading = false;
      this.errorMessage = '';
      this.showDetails = false;
      this.animationProgress = 0;
      this.refreshCounter = 0;
      this.retryCount = 0;
      this.lastSuccessTime = Date.now();

      this.logDebug('Component initialized successfully');
    } catch (error) {
      this.handleError(error as Error);
    }
  }

  /**
   * @method startAutoRefresh
   * @description Starts the auto-refresh timer.
   * @private
   */
  private startAutoRefresh(): void {
    if (this.config.enabled && this.config.refreshInterval > 0) {
      this.refreshTimer = setInterval(() => {
        this.handleRefresh();
      }, this.config.refreshInterval);
    }
  }

  /**
   * @method stopAutoRefresh
   * @description Stops the auto-refresh timer.
   * @private
   */
  private stopAutoRefresh(): void {
    if (this.refreshTimer !== -1) {
      clearInterval(this.refreshTimer);
      this.refreshTimer = -1;
    }
  }

  /**
   * @method cleanupResources
   * @description Cleans up component resources.
   * @private
   */
  private cleanupResources(): void {
    if (this.animationFrameId !== -1) {
      cancelAnimationFrame(this.animationFrameId);
      this.animationFrameId = -1;
    }
    this.onEventCallback = null;
    this.onErrorCallback = null;
    this.onLoadingCallback = null;
  }

  /**
   * @method handleRefresh
   * @description Handles the refresh action.
   */
  async handleRefresh(): Promise<void> {
    if (!this.config.enabled) {
      return;
    }

    try {
      this.isLoading = true;
      this.notifyLoading(true);
      this.refreshCounter++;

      await this.performRefresh();

      this.isLoading = false;
      this.lastSuccessTime = Date.now();
      this.retryCount = 0;
      this.notifyLoading(false);

      this.emitEvent({
        eventType: 'refresh',
        timestamp: Date.now(),
        source: 'HealthDataViewComponent',
        data: { refreshCount: this.refreshCounter },
        success: true,
        errorMessage: '',
        priority: 'normal',
        bubble: true,
        metadata: new Map()
      });

      this.logDebug('Refresh completed successfully');
    } catch (error) {
      this.handleError(error as Error);
    }
  }

  /**
   * @method performRefresh
   * @description Performs the actual refresh operation.
   * @returns {Promise<void>}
   * @private
   */
  private async performRefresh(): Promise<void> {
    // Simulate async operation
    return new Promise<void>((resolve) => {
      setTimeout(resolve, 100);
    });
  }

  /**
   * @method handleError
   * @description Handles errors that occur during component operations.
   * @param {Error} error - The error that occurred.
   * @private
   */
  private handleError(error: Error): void {
    this.isLoading = false;
    this.errorMessage = error.message || 'Unknown error occurred';
    this.retryCount++;

    this.notifyLoading(false);

    if (this.onErrorCallback) {
      this.onErrorCallback(error);
    }

    this.emitEvent({
      eventType: 'error',
      timestamp: Date.now(),
      source: 'HealthDataViewComponent',
      data: { error: error.message },
      success: false,
      errorMessage: error.message,
      priority: 'high',
      bubble: true,
      metadata: new Map()
    });

    hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s error: %{public}s', 'HealthDataViewComponent', error.message);

    if (this.retryCount < this.config.maxRetryAttempts) {
      this.logDebug(`Retrying... Attempt ${this.retryCount} of ${this.config.maxRetryAttempts}`);
      setTimeout(() => {
        this.handleRefresh();
      }, 1000 * this.retryCount);
    }
  }

  /**
   * @method emitEvent
   * @description Emits an event to registered callbacks.
   * @param {HealthDataViewComponentEventData} event - The event data.
   * @private
   */
  private emitEvent(event: HealthDataViewComponentEventData): void {
    if (this.onEventCallback) {
      try {
        this.onEventCallback(event);
      } catch (error) {
        hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s event callback error: %{public}s',
          'HealthDataViewComponent', JSON.stringify(error));
      }
    }
  }

  /**
   * @method notifyLoading
   * @description Notifies loading state changes.
   * @param {boolean} isLoading - Whether loading is in progress.
   * @private
   */
  private notifyLoading(isLoading: boolean): void {
    if (this.onLoadingCallback) {
      try {
        this.onLoadingCallback(isLoading);
      } catch (error) {
        hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s loading callback error: %{public}s',
          'HealthDataViewComponent', JSON.stringify(error));
      }
    }
  }

  /**
   * @method setOnEventCallback
   * @description Sets the event callback.
   * @param {(event: HealthDataViewComponentEventData) => void} callback - The callback function.
   */
  setOnEventCallback(callback: (event: HealthDataViewComponentEventData) => void): void {
    this.onEventCallback = callback;
  }

  /**
   * @method setOnErrorCallback
   * @description Sets the error callback.
   * @param {(error: Error) => void} callback - The callback function.
   */
  setOnErrorCallback(callback: (error: Error) => void): void {
    this.onErrorCallback = callback;
  }

  /**
   * @method setOnLoadingCallback
   * @description Sets the loading callback.
   * @param {(isLoading: boolean) => void} callback - The callback function.
   */
  setOnLoadingCallback(callback: (isLoading: boolean) => void): void {
    this.onLoadingCallback = callback;
  }

  /**
   * @method updateConfig
   * @description Updates the component configuration.
   * @param {Partial<HealthDataViewComponentConfig>} newConfig - Partial configuration to update.
   */
  updateConfig(newConfig: Partial<HealthDataViewComponentConfig>): void {
    this.config = { ...this.config, ...newConfig };
    this.logDebug('Configuration updated');

    if (newConfig.refreshInterval !== undefined) {
      this.stopAutoRefresh();
      this.startAutoRefresh();
    }
  }

  /**
   * @method getConfig
   * @description Returns the current configuration.
   * @returns {HealthDataViewComponentConfig} The current configuration.
   */
  getConfig(): HealthDataViewComponentConfig {
    return { ...this.config };
  }

  /**
   * @method getStatistics
   * @description Returns component statistics.
   * @returns {object} Statistics object.
   */
  getStatistics(): object {
    return {
      mountTime: this.mountTime,
      uptime: Date.now() - this.mountTime,
      refreshCount: this.refreshCounter,
      retryCount: this.retryCount,
      lastSuccessTime: this.lastSuccessTime,
      isLoading: this.isLoading,
      hasError: this.errorMessage.length > 0,
      isEnabled: this.config.enabled
    };
  }

  /**
   * @method logDebug
   * @description Logs a debug message if debug logging is enabled.
   * @param {string} message - The message to log.
   * @private
   */
  private logDebug(message: string): void {
    if (this.config.debugLogging) {
      hilog.debug(0xF830, BluetoothConstants.TAG, '%{public}s: %{public}s', 'HealthDataViewComponent', message);
    }
  }

  /**
   * @method animateProgress
   * @description Animates the progress value.
   * @param {number} targetProgress - Target progress value (0-100).
   */
  animateProgress(targetProgress: number): void {
    const startProgress = this.animationProgress;
    const startTime = Date.now();
    const duration = this.config.animationDuration;

    const animate = () => {
      const elapsed = Date.now() - startTime;
      const progress = Math.min(elapsed / duration, 1);
      this.animationProgress = startProgress + (targetProgress - startProgress) * progress;

      if (progress < 1) {
        this.animationFrameId = requestAnimationFrame(animate);
      }
    };

    this.animationFrameId = requestAnimationFrame(animate);
  }

  /**
   * @method reset
   * @description Resets the component to its initial state.
   */
  reset(): void {
    this.initializeComponent();
    this.logDebug('Component reset');
  }

  /**
   * @method build
   * @description Builds the component UI.
   */
  build() {
    Column() {
      if (this.isLoading && this.config.showLoading) {
        this.LoadingView()
      } else if (this.errorMessage.length > 0) {
        this.ErrorView()
      } else {
        this.ContentView()
      }

      if (this.showDetails) {
        this.DetailsView()
      }
    }
    .width('100%')
    .padding(15)
    .backgroundColor('#FFFFFF')
    .borderRadius(10)
    .shadow({ radius: 5, color: 'rgba(0,0,0,0.1)', offsetX: 0, offsetY: 2 })
    .margin({ bottom: 10 })
  }

  /**
   * @method LoadingView
   * @description Builds the loading view.
   * @returns {Widget} The loading view widget.
   */
  @Builder
  LoadingView() {
    Column() {
      LoadingProgress()
        .width(50)
        .height(50)
        .color(this.config.themeColor)

      Text($r('app.string.p_loading'))
        .fontSize(PageConstants.FONT_SIZE_BODY)
        .fontColor('#666666')
        .margin({ top: 10 })
    }
    .width('100%')
    .height(100)
    .justifyContent(FlexAlign.Center)
  }

  /**
   * @method ErrorView
   * @description Builds the error view.
   * @returns {Widget} The error view widget.
   */
  @Builder
  ErrorView() {
    Column() {
      Text('⚠')
        .fontSize(40)
        .fontColor('#FF5252')

      Text(this.errorMessage)
        .fontSize(PageConstants.FONT_SIZE_BODY)
        .fontColor('#FF5252')
        .margin({ top: 10 })
        .textAlign(TextAlign.Center)

      Button($r('app.string.p_btn_retry'))
        .onClick(() => {
          this.handleRefresh();
        })
        .backgroundColor(this.config.themeColor)
        .fontColor('#FFFFFF')
        .margin({ top: 15 })
        .height(40)
    }
    .width('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }

  /**
   * @method ContentView
   * @description Builds the main content view.
   * @returns {Widget} The content view widget.
   */
  @Builder
  ContentView() {
    Column() {
      Row() {
        Text($r('app.string.p_comp_health_data'))
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.config.themeColor)

        Blank()

        Button(this.showDetails ? 'Hide' : 'Show')
          .onClick(() => {
            this.showDetails = !this.showDetails;
          })
          .fontSize(PageConstants.FONT_SIZE_CAPTION)
          .height(30)
          .backgroundColor('#F5F5F5')
          .fontColor('#666666')
      }
      .width('100%')
      .margin({ bottom: 15 })

      Column() {
        Text($r('app.string.p_comp_health_data'))
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        Text($r('app.string.p_status_fmt', this.status))
          .fontSize(PageConstants.FONT_SIZE_BODY)
          .fontColor('#666666')

        Text($r('app.string.p_value_fmt', this.value.toString()))
          .fontSize(PageConstants.FONT_SIZE_BODY)
          .fontColor('#666666')
          .margin({ top: 5 })
      }
    }
    .width('100%')
  }

  /**
   * @method DetailsView
   * @description Builds the details view.
   * @returns {Widget} The details view widget.
   */
  @Builder
  DetailsView() {
    Column() {
      Divider().margin({ top: 15, bottom: 15 })

      Text($r('app.string.p_btn_details'))
        .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })

      this.DetailRow($r('app.string.p_refresh_count'), this.refreshCounter.toString())
      this.DetailRow($r('app.string.p_retry_count'), this.retryCount.toString())
      this.DetailRow($r('app.string.p_last_success'), new Date(this.lastSuccessTime).toLocaleTimeString())
      this.DetailRow($r('app.string.p_uptime'), this.formatUptime(Date.now() - this.mountTime))
      this.DetailRow($r('app.string.p_enabled'), this.config.enabled ? 'Yes' : 'No')
      this.DetailRow($r('app.string.p_display_mode'), this.config.displayMode)
    }
    .width('100%')
    .padding(10)
    .backgroundColor('#F5F5F5')
    .borderRadius(5)
    .margin({ top: 10 })
  }

  /**
   * @method DetailRow
   * @description Builds a detail row widget.
   * @param {string} label - The row label.
   * @param {string} value - The row value.
   * @returns {Widget} The detail row widget.
   */
  @Builder
  DetailRow(label: ResourceStr, value: string) {
    Row() {
      Text(label)
        .fontSize(PageConstants.FONT_SIZE_CAPTION)
        .fontColor('#666666')

      Blank()

      Text(value)
        .fontSize(PageConstants.FONT_SIZE_CAPTION)
        .fontWeight(FontWeight.Medium)
    }
    .width('100%')
    .padding({ top: 5, bottom: 5 })
  }

  /**
   * @method formatUptime
   * @description Formats uptime in milliseconds to a human-readable string.
   * @param {number} uptimeMs - Uptime in milliseconds.
   * @returns {string} Formatted uptime string.
   */
  formatUptime(uptimeMs: number): string {
    const seconds = Math.floor(uptimeMs / 1000);
    const minutes = Math.floor(seconds / 60);
    const hours = Math.floor(minutes / 60);

    if (hours > 0) {
      return hours + 'h ' + (minutes % 60) + 'm';
    } else if (minutes > 0) {
      return minutes + 'm ' + (seconds % 60) + 's';
    } else {
      return seconds + 's';
    }
  }
}
