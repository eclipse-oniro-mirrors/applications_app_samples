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

import { common, Want, WantAgent, wantAgent } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { notificationManager } from '@kit.NotificationKit';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { Logger } from '../utils/Logger';

// Module-level counter that produces a unique task id for every trace span.
let traceTaskIdCounter: number = 0;

// Ability opened when the user taps a check-in notification.
const ENTRY_ABILITY_NAME: string = 'EntryAbility';
// Notification id used for enter events so re-publishes replace the old one.
const ENTER_NOTIFICATION_ID: number = 1001;
// Notification id used for exit events so re-publishes replace the old one.
const EXIT_NOTIFICATION_ID: number = 1002;

/**
 * Notification helper that publishes fence enter and exit notifications.
 * It also owns the notification enable dialog used by the permission flow.
 */
export class NotificationService {
  /**
   * Check whether notifications are enabled for this application.
   * @returns a promise resolving to true when notifications are enabled
   */
  static isEnabled(): Promise<boolean> {
    // Query the notification switch from the system service.
    return notificationManager.isNotificationEnabled()
      .then((enabled: boolean): boolean => {
        // Report the switch state for later diagnosis.
        Logger.debug('NotificationService#isEnabled: ' + enabled);
        return enabled;
      })
      .catch((error: BusinessError): boolean => {
        // Treat a failed query as disabled so callers skip publishing.
        Logger.warn('NotificationService#isEnabled failed: ' + error.code);
        return false;
      });
  }

  /**
   * Show the system dialog asking the user to enable notifications.
   * @param context UI ability context used to show the dialog
   * @returns a promise resolving to true when the user enables notifications
   */
  static requestEnable(context: common.UIAbilityContext): Promise<boolean> {
    // Open a trace span for the notification permission request.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('NotificationService#requestEnable', taskId);
    // Show the enable dialog through the system service.
    return notificationManager.requestEnableNotification(context)
      .then((): boolean => {
        // Close the trace span and report the user decision.
        hiTraceMeter.finishTrace('NotificationService#requestEnable', taskId);
        Logger.info('NotificationService#requestEnable: enabled');
        return true;
      })
      .catch((error: BusinessError): boolean => {
        // Close the trace span and report the rejection or failure.
        hiTraceMeter.finishTrace('NotificationService#requestEnable', taskId);
        Logger.warn('NotificationService#requestEnable failed: ' + error.code);
        return false;
      });
  }

  /**
   * Publish the notification shown when the device enters the fence.
   * @param context context used to read resources and build the tap action
   * @param timeText formatted enter time shown in the notification text
   * @returns a promise that resolves when the notification is published or skipped
   */
  static async publishEnter(context: common.Context, timeText: string): Promise<void> {
    // Open a trace span for the enter notification flow.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('NotificationService#publishEnter', taskId);
    try {
      // Build and publish the enter notification with the localized texts.
      await NotificationService.publish(context, ENTER_NOTIFICATION_ID,
        $r('app.string.gc_notify_enter_title'), $r('app.string.gc_notify_enter_text'), timeText);
    } finally {
      // Close the trace span whatever the publish outcome is.
      hiTraceMeter.finishTrace('NotificationService#publishEnter', taskId);
    }
  }

  /**
   * Publish the notification shown when the device leaves the fence.
   * @param context context used to read resources and build the tap action
   * @param durationText formatted stay duration shown in the notification text
   * @returns a promise that resolves when the notification is published or skipped
   */
  static async publishExit(context: common.Context, durationText: string): Promise<void> {
    // Open a trace span for the exit notification flow.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('NotificationService#publishExit', taskId);
    try {
      // Build and publish the exit notification with the localized texts.
      await NotificationService.publish(context, EXIT_NOTIFICATION_ID,
        $r('app.string.gc_notify_exit_title'), $r('app.string.gc_notify_exit_text'), durationText);
    } finally {
      // Close the trace span whatever the publish outcome is.
      hiTraceMeter.finishTrace('NotificationService#publishExit', taskId);
    }
  }

  /**
   * Build the notification request and publish it through the system service.
   * @param context context used to read resources and build the tap action
   * @param notificationId id of the notification so updates replace the old one
   * @param titleRes string resource of the notification title
   * @param textRes string resource of the notification text prefix
   * @param extraText formatted time or duration appended to the text
   * @returns a promise that resolves when the notification is published or skipped
   */
  private static async publish(context: common.Context, notificationId: number, titleRes: Resource,
    textRes: Resource, extraText: string): Promise<void> {
    // Skip publishing entirely when notifications are disabled.
    const enabled: boolean = await NotificationService.isEnabled();
    if (!enabled) {
      Logger.warn('NotificationService#publish: notification disabled, skip id=' + notificationId);
      return;
    }
    // Resolve the localized title from the string resource.
    const title: string = context.resourceManager.getStringSync(titleRes.id);
    // Resolve the localized text and append the formatted time or duration.
    const text: string = context.resourceManager.getStringSync(textRes.id) + ' ' + extraText;
    // Describe the ability to open when the user taps the notification.
    const want: Want = {
      bundleName: context.applicationInfo.name,
      abilityName: ENTRY_ABILITY_NAME
    };
    // Wrap the want into a want agent for the notification tap action.
    const agentInfo: wantAgent.WantAgentInfo = {
      wants: [want],
      actionType: wantAgent.OperationType.START_ABILITY,
      requestCode: notificationId
    };
    // Create the want agent used by the notification.
    const agent: WantAgent = await wantAgent.getWantAgent(agentInfo);
    // Assemble the basic text notification on the social communication slot.
    const request: notificationManager.NotificationRequest = {
      id: notificationId,
      content: {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: title,
          text: text
        }
      },
      notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
      wantAgent: agent
    };
    // Publish the notification and report the outcome without breaking the flow.
    await notificationManager.publish(request)
      .then((): void => {
        Logger.info('NotificationService#publish: published id=' + notificationId);
      })
      .catch((error: BusinessError) => {
        Logger.warn('NotificationService#publish failed: ' + error.code);
      });
  }
}
