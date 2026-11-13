/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog, hiAppEvent } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { SystemConfigConstants } from '../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/** hiAppEvent custom event domain (letters/digits/underscore only, starting with a letter) */
const EVENT_DOMAIN: string = 'SystemConfig';

/**
 * Event type enum.
 * Defines all event types reported via hiAppEvent.
 */
export enum EventTypeName {
  /** Channel fetch event */
  CHANNEL_FETCHED = 'channelFetched',
  /** DND state changed event */
  DND_STATE_CHANGED = 'dndStateChanged',
  /** Notify-allowed state changed event */
  NOTIFY_STATE_CHANGED = 'notifyStateChanged',
  /** Settings page opened event */
  SETTINGS_PAGE_OPENED = 'settingsPageOpened',
  /** Double-click query event */
  DOUBLE_CLICK_QUERIED = 'doubleClickQueried',
  /** Error event */
  ERROR_OCCURRED = 'errorOccurred',
  /** Service initialization event */
  SERVICE_INITIALIZED = 'serviceInitialized'
}

/**
 * Event filter interface.
 * Used to filter events by type and time range.
 */
export interface EventFilter {
  /** Event types to filter */
  eventTypes?: EventTypeName[];
  /** Start timestamp */
  startTime?: number;
  /** End timestamp */
  endTime?: number;
  /** Maximum number of results */
  maxCount?: number;
}

/**
 * Event statistics interface.
 * Used to summarize event reporting statistics.
 */
export interface EventStatistics {
  /** Total event count */
  totalCount: number;
  /** Event counts grouped by type */
  countByType: Map<string, number>;
  /** Earliest event time */
  earliestTime: number;
  /** Latest event time */
  latestTime: number;
}

/**
 * Event listener interface.
 * Used to receive event reporting notifications.
 */
export interface EventListener {
  /** Invoked when an event is reported */
  onEvent(eventName: string, eventData: Record<string, Object>): void;
}

/**
 * Event history record interface.
 * Used to store a single event record.
 */
export interface EventHistoryRecord {
  /** Event name */
  name: string;
  /** Event data */
  data: Record<string, Object>;
  /** Event timestamp */
  time: number;
}

/**
 * Event service.
 * Encapsulates the event reporting capability of hiAppEvent (hiAppEvent.write);
 * each report also maintains local history and listener notifications for observability.
 * Provides event registration, reporting, filtering and statistics.
 */
export class EventService {
  /** Event listener list */
  private listeners: EventListener[] = [];
  /** Event history records */
  private eventHistory: EventHistoryRecord[] = [];
  /** Whether the service has been initialized */
  private isInitialized: boolean = false;
  /** Maximum history record count */
  private maxHistorySize: number = SystemConfigConstants.MAX_LOG_ENTRIES;
  /** hiAppEvent.write success count */
  private writeSuccessCount: number = 0;
  /** hiAppEvent.write failure count */
  private writeFailCount: number = 0;

  /**
   * Initializes the event service.
   * Initializes the event history.
   * @returns {boolean} Whether initialization succeeded
   */
  initialize(): boolean {
    hilog.info(DOMAIN, TAG, 'EventService initialize: starting initialization');

    try {
      // Under the Stage model, app events are reported directly via hiAppEvent.write without registering a watcher
      hilog.info(DOMAIN, TAG, 'EventService initialize: event service initialized');
      this.isInitialized = true;
      this.eventHistory = [];
      this.writeSuccessCount = 0;
      this.writeFailCount = 0;
      hilog.info(DOMAIN, TAG, 'EventService initialize: initialization complete');
      return true;
    } catch (err) {
      const errObj = err as Record<string, Object>;
      const errMsg: string = (errObj['message'] as string) ?? 'Unknown error';
      hilog.error(DOMAIN, TAG, 'EventService initialize: failed, error=%{public}s', errMsg);
      return false;
    }
  }

  // ========================================
  // Event reporting methods
  // ========================================

  /**
   * Reports a channel fetch event.
   * @param {string} channelId - The fetched channel id
   * @param {boolean} success - Whether it succeeded
   */
  reportChannelFetched(channelId: string, success: boolean): void {
    hilog.info(DOMAIN, TAG, 'EventService reportChannelFetched: channelId=%{public}s, success=%{public}s',
      channelId, success.toString());
    this.emitEvent(EventTypeName.CHANNEL_FETCHED, {
      'channelId': channelId,
      'success': success,
      'timestamp': Date.now()
    });
  }

  /**
   * Reports a DND state changed event.
   * @param {boolean} dndEnabled - Whether DND is enabled
   * @param {boolean} notifyAllowed - Whether notifications are allowed
   */
  reportDndStateChanged(dndEnabled: boolean, notifyAllowed: boolean): void {
    hilog.info(DOMAIN, TAG, 'EventService reportDndStateChanged: dnd=%{public}s, notify=%{public}s',
      dndEnabled.toString(), notifyAllowed.toString());
    this.emitEvent(EventTypeName.DND_STATE_CHANGED, {
      'dndEnabled': dndEnabled,
      'notifyAllowed': notifyAllowed,
      'timestamp': Date.now()
    });
  }

  /**
   * Reports a settings page opened event.
   * @param {string} pageType - Page type (pin/nfc/doubleClick)
   * @param {boolean} success - Whether it succeeded
   */
  reportSettingsPageOpened(pageType: string, success: boolean): void {
    hilog.info(DOMAIN, TAG, 'EventService reportSettingsPageOpened: page=%{public}s, success=%{public}s',
      pageType, success.toString());
    this.emitEvent(EventTypeName.SETTINGS_PAGE_OPENED, {
      'pageType': pageType,
      'success': success,
      'timestamp': Date.now()
    });
  }

  /**
   * Reports a double-click query event.
   * @param {string} result - Query result
   */
  reportDoubleClickQueried(result: string): void {
    hilog.info(DOMAIN, TAG, 'EventService reportDoubleClickQueried: result=%{public}s', result);
    this.emitEvent(EventTypeName.DOUBLE_CLICK_QUERIED, {
      'result': result,
      'timestamp': Date.now()
    });
  }

  /**
   * Reports an error event.
   * @param {string} source - Error source
   * @param {string} errorMessage - Error message
   * @param {number} errorCode - Error code
   */
  reportError(source: string, errorMessage: string, errorCode: number): void {
    hilog.error(DOMAIN, TAG, 'EventService reportError: source=%{public}s, error=%{public}s, code=%{public}d',
      source, errorMessage, errorCode);
    this.emitEvent(EventTypeName.ERROR_OCCURRED, {
      'source': source,
      'errorMessage': errorMessage,
      'errorCode': errorCode,
      'timestamp': Date.now()
    });
  }

  /**
   * Reports a service initialization event.
   * @param {string} serviceName - Service name
   */
  reportServiceInitialized(serviceName: string): void {
    hilog.info(DOMAIN, TAG, 'EventService reportServiceInitialized: service=%{public}s', serviceName);
    this.emitEvent(EventTypeName.SERVICE_INITIALIZED, {
      'serviceName': serviceName,
      'timestamp': Date.now()
    });
  }

  // ========================================
  // Event listener methods
  // ========================================

  /**
   * Adds an event listener.
   * @param {EventListener} listener - Listener instance
   */
  addListener(listener: EventListener): void {
    hilog.info(DOMAIN, TAG, 'EventService addListener: adding listener');
    this.listeners.push(listener);
  }

  /**
   * Removes an event listener.
   * @param {EventListener} listener - Listener to remove
   */
  removeListener(listener: EventListener): void {
    hilog.info(DOMAIN, TAG, 'EventService removeListener: removing listener');
    const index: number = this.listeners.indexOf(listener);
    if (index >= 0) {
      this.listeners.splice(index, 1);
    }
  }

  /**
   * Gets the event history.
   * @param {EventFilter} [filter] - Filter criteria
   * @returns {EventHistoryRecord[]} Event history
   */
  getEventHistory(filter?: EventFilter): EventHistoryRecord[] {
    hilog.debug(DOMAIN, TAG, 'EventService getEventHistory: historySize=%{public}d', this.eventHistory.length);
    let result = [...this.eventHistory];

    if (filter) {
      if (filter.eventTypes && filter.eventTypes.length > 0) {
        const typeNames: string[] = filter.eventTypes.map(t => t as string);
        result = result.filter(e => typeNames.includes(e.name));
      }
      if (filter.startTime !== undefined) {
        result = result.filter(e => e.time >= filter.startTime!);
      }
      if (filter.endTime !== undefined) {
        result = result.filter(e => e.time <= filter.endTime!);
      }
      if (filter.maxCount !== undefined && filter.maxCount > 0) {
        result = result.slice(-filter.maxCount);
      }
    }
    hilog.debug(DOMAIN, TAG, 'EventService getEventHistory: filteredSize=%{public}d', result.length);
    return result;
  }

  /**
   * Gets event statistics.
   * @returns {EventStatistics} Statistics result
   */
  getStatistics(): EventStatistics {
    hilog.info(DOMAIN, TAG, 'EventService getStatistics: calculating');
    const countByType: Map<string, number> = new Map<string, number>();
    let earliestTime: number = Number.MAX_VALUE;
    let latestTime: number = 0;

    for (const event of this.eventHistory) {
      const count: number = countByType.get(event.name) ?? 0;
      countByType.set(event.name, count + 1);
      if (event.time < earliestTime) {
        earliestTime = event.time;
      }
      if (event.time > latestTime) {
        latestTime = event.time;
      }
    }

    if (this.eventHistory.length === 0) {
      earliestTime = 0;
    }

    const stats: EventStatistics = {
      totalCount: this.eventHistory.length,
      countByType: countByType,
      earliestTime: earliestTime,
      latestTime: latestTime
    };
    hilog.info(DOMAIN, TAG, 'EventService getStatistics: total=%{public}d, types=%{public}d',
      stats.totalCount, countByType.size);
    return stats;
  }

  // ========================================
  // Internal methods
  // ========================================

  /**
   * Dispatches the event to all listeners and records history,
   * while also reporting the app event via hiAppEvent.write.
   * @param {EventTypeName} eventName - Event name
   * @param {Record<string, Object>} eventData - Event data
   */
  private emitEvent(eventName: EventTypeName, eventData: Record<string, Object>): void {
    hilog.debug(DOMAIN, TAG, 'EventService emitEvent: name=%{public}s', eventName);

    const record: EventHistoryRecord = {
      name: eventName as string,
      data: eventData,
      time: Date.now()
    };
    this.eventHistory.push(record);

    if (this.eventHistory.length > this.maxHistorySize) {
      hilog.debug(DOMAIN, TAG, 'EventService emitEvent: trimming history, size=%{public}d',
        this.eventHistory.length);
      this.eventHistory = this.eventHistory.slice(-this.maxHistorySize);
    }

    for (const listener of this.listeners) {
      try {
        listener.onEvent(eventName as string, eventData);
      } catch (listenerErr) {
        hilog.error(DOMAIN, TAG, 'EventService emitEvent: listener error');
      }
    }

    this.writeToHiAppEvent(eventName, eventData);
  }

  /**
   * Reports the app event via hiAppEvent.write.
   * Error events use the FAULT type, others use the BEHAVIOR type.
   * Reporting failures are only logged and do not affect local history or listener notifications.
   * @param {EventTypeName} eventName - Event name
   * @param {Record<string, Object>} eventData - Event data
   */
  private writeToHiAppEvent(eventName: EventTypeName, eventData: Record<string, Object>): void {
    const info: hiAppEvent.AppEventInfo = {
      domain: EVENT_DOMAIN,
      name: eventName as string,
      eventType: eventName === EventTypeName.ERROR_OCCURRED
        ? hiAppEvent.EventType.FAULT
        : hiAppEvent.EventType.BEHAVIOR,
      params: eventData
    };
    // Parameter validation of hiAppEvent.write may throw synchronously;
    // catching it keeps local history and listener notifications unaffected
    try {
      hiAppEvent.write(info).then(() => {
        this.writeSuccessCount += 1;
        hilog.debug(DOMAIN, TAG, 'EventService writeToHiAppEvent: %{public}s written', eventName);
      }).catch((err: BusinessError) => {
        this.writeFailCount += 1;
        hilog.error(DOMAIN, TAG, 'EventService writeToHiAppEvent: %{public}s failed, code=%{public}d, msg=%{public}s',
          eventName, err.code, err.message);
      });
    } catch (syncErr) {
      this.writeFailCount += 1;
      const businessErr = syncErr as BusinessError;
      hilog.error(DOMAIN, TAG, 'EventService writeToHiAppEvent: %{public}s threw synchronously, msg=%{public}s',
        eventName, businessErr.message ?? 'unknown');
    }
  }

  /**
   * Gets hiAppEvent.write reporting statistics.
   * @returns {number[]} [success count, failure count]
   */
  getWriteCounters(): number[] {
    return [this.writeSuccessCount, this.writeFailCount];
  }

  /**
   * Determines whether the service has been initialized.
   * @returns {boolean} Whether it is initialized
   */
  isServiceInitialized(): boolean {
    return this.isInitialized;
  }

  /**
   * Clears the event history.
   */
  clearHistory(): void {
    hilog.info(DOMAIN, TAG, 'EventService clearHistory: clearing %{public}d events', this.eventHistory.length);
    this.eventHistory = [];
  }

  /**
   * Destroys the event service.
   * Removes all listeners and clears the history.
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'EventService destroy: releasing resources');
    this.listeners = [];
    this.eventHistory = [];
    this.writeSuccessCount = 0;
    this.writeFailCount = 0;
    this.isInitialized = false;
    hilog.info(DOMAIN, TAG, 'EventService destroy: resources released');
  }
}
