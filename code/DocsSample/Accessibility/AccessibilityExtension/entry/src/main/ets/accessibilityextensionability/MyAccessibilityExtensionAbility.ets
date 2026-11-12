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

import {
  AccessibilityExtensionAbility,
  AccessibilityEvent,
  AccessibilityElement,
  ElementAttributeKeys,
  FocusType,
  FocusDirection,
  GesturePath,
  GesturePoint
} from '@kit.AccessibilityKit';
import { KeyEvent } from '@kit.InputKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const INTERCEPT_KEY_CODE: number = 16;

interface Rect {
  left: number;
  top: number;
  width: number;
  height: number;
}

export default class MyAccessibilityExtensionAbility extends AccessibilityExtensionAbility {
  private isConnected: boolean = false;

  onConnect(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'AccessibilityExtensionAbility onConnect.');
    this.isConnected = true;
    this.initializeService();
  }

  onDisconnect(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'AccessibilityExtensionAbility onDisconnect.');
    this.isConnected = false;
    this.cleanupService();
  }

  onAccessibilityEvent(event: AccessibilityEvent): void {
    let eventType: string = event.eventType;
    hilog.info(DOMAIN, TAG, 'onAccessibilityEvent: %{public}s', eventType);

    if (!this.isConnected) {
      hilog.warn(DOMAIN, TAG, '%{public}s', 'Received event but service is not connected, ignoring.');
      return;
    }

    if (eventType === 'click') {
      this.handleClickEvent(event);
    } else if (eventType === 'longClick') {
      this.handleLongClickEvent(event);
    } else if (eventType === 'focus') {
      this.handleFocusEvent(event);
    } else if (eventType === 'select') {
      this.handleSelectEvent(event);
    } else if (eventType === 'hoverEnter') {
      this.handleHoverEnterEvent(event);
    } else if (eventType === 'hoverExit') {
      this.handleHoverExitEvent(event);
    } else if (eventType === 'textUpdate') {
      this.handleTextUpdateEvent(event);
    } else if (eventType === 'textSelectionUpdate') {
      this.handleTextSelectionUpdateEvent(event);
    } else if (eventType === 'scroll') {
      this.handleScrollEvent(event);
    } else if (eventType === 'scrolling') {
      this.handleScrollingEvent(event);
    } else if (eventType === 'accessibilityFocus') {
      this.handleAccessibilityFocusEvent(event);
    } else if (eventType === 'accessibilityFocusClear') {
      this.handleAccessibilityFocusClearEvent(event);
    } else if (eventType === 'requestFocusForAccessibility') {
      this.handleRequestFocusEvent(event);
    } else if (eventType === 'announceForAccessibility') {
      this.handleAnnounceEvent(event);
    } else if (eventType === 'touchBegin') {
      this.handleTouchBeginEvent(event);
    } else if (eventType === 'touchEnd') {
      this.handleTouchEndEvent(event);
    } else if (eventType === 'touchGuideGesture') {
      this.handleTouchGuideGestureEvent(event);
    } else if (eventType === 'left' || eventType === 'right' ||
      eventType === 'up' || eventType === 'down') {
      this.handleGestureEvent(event);
    } else if (eventType === 'leftThenRight' || eventType === 'leftThenUp' ||
      eventType === 'leftThenDown' || eventType === 'rightThenLeft' ||
      eventType === 'rightThenUp' || eventType === 'rightThenDown' ||
      eventType === 'upThenLeft' || eventType === 'upThenRight' ||
      eventType === 'upThenDown' || eventType === 'downThenLeft' ||
      eventType === 'downThenRight' || eventType === 'downThenUp') {
      this.handleDirectionalGesture(event);
    } else if (eventType === 'twoFingerSingleTap' || eventType === 'twoFingerDoubleTap' ||
      eventType === 'twoFingerDoubleTapAndHold' || eventType === 'twoFingerTripleTap' ||
      eventType === 'twoFingerTripleTapAndHold' || eventType === 'threeFingerSingleTap' ||
      eventType === 'threeFingerDoubleTap' || eventType === 'threeFingerDoubleTapAndHold' ||
      eventType === 'threeFingerTripleTap' || eventType === 'threeFingerTripleTapAndHold' ||
      eventType === 'fourFingerSingleTap' || eventType === 'fourFingerDoubleTap' ||
      eventType === 'fourFingerDoubleTapAndHold' || eventType === 'fourFingerTripleTap' ||
      eventType === 'fourFingerTripleTapAndHold' || eventType === 'oneFingerDoubleTap') {
      this.handleMultiFingerTapGesture(event);
    } else if (eventType === 'threeFingerSwipeUp' || eventType === 'threeFingerSwipeDown' ||
      eventType === 'threeFingerSwipeLeft' || eventType === 'threeFingerSwipeRight' ||
      eventType === 'fourFingerSwipeUp' || eventType === 'fourFingerSwipeDown' ||
      eventType === 'fourFingerSwipeLeft' || eventType === 'fourFingerSwipeRight') {
      this.handleMultiFingerSwipeGesture(event);
    } else if (eventType === 'pageContentUpdate') {
      this.handlePageContentUpdateEvent(event);
    } else if (eventType === 'pageStateUpdate') {
      this.handlePageStateUpdateEvent(event);
    } else if (eventType === 'pageStatePreUpdate') {
      this.handlePageStatePreUpdateEvent(event);
    } else if (eventType === 'add' || eventType === 'remove' ||
      eventType === 'bounds' || eventType === 'active') {
      this.handleWindowUpdateEvent(event);
    } else {
      hilog.info(DOMAIN, TAG, 'Unhandled event type: %{public}s', eventType);
    }
  }

  onKeyEvent(keyEvent: KeyEvent): boolean {
    hilog.info(DOMAIN, TAG, 'onKeyEvent keyCode: %{public}d', keyEvent.key.code);
    if (keyEvent.key.code === INTERCEPT_KEY_CODE) {
      hilog.info(DOMAIN, TAG, 'Intercept keyCode: %{public}d', INTERCEPT_KEY_CODE);
      return true;
    }
    return false;
  }

  private initializeService(): void {
    let targetNames: string[] = ['com.samples.accessibilityextension'];
    this.context.setTargetBundleName(targetNames).then(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in setting target bundle names.');
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to set target bundle names. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private cleanupService(): void {
    let emptyNames: string[] = [];
    this.context.setTargetBundleName(emptyNames).then(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in clearing target bundle names.');
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to clear target bundle names. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private handleClickEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Click event received.');
    this.logEventDetails(event);
    this.queryElementInfo(event);
    this.queryFocusElement();
  }

  private handleLongClickEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Long click event received.');
    this.logEventDetails(event);
    this.queryElementInfo(event);
  }

  private handleFocusEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Focus event received.');
    this.logEventDetails(event);
    this.queryFocusElement();
  }

  private handleSelectEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Select event received.');
    this.logEventDetails(event);
    this.queryElementInfo(event);
  }

  private handleHoverEnterEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Hover enter event received.');
    this.logEventDetails(event);
  }

  private handleHoverExitEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Hover exit event received.');
    this.logEventDetails(event);
  }

  private handleTextUpdateEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Text update event received.');
    this.logEventDetails(event);
    if (event.extraInfo !== undefined && event.extraInfo.length > 0) {
      hilog.info(DOMAIN, TAG, 'Text changed content: %{public}s', event.extraInfo);
    }
    this.queryElementText(event);
  }

  private handleTextSelectionUpdateEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Text selection update event received.');
    this.logEventDetails(event);
  }

  private handleScrollEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Scroll event received.');
    this.queryElementInfo(event);
  }

  private handleScrollingEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Scrolling event received (item scrolled off screen).');
  }

  private handleAccessibilityFocusEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Accessibility focus event received.');
    this.logEventDetails(event);
    if (event.elementId !== undefined && event.elementId > 0) {
      hilog.info(DOMAIN, TAG, 'Accessibility focused elementId: %{public}d', event.elementId);
    }
    this.queryFocusElement();
  }

  private handleAccessibilityFocusClearEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Accessibility focus clear event received.');
  }

  private handleRequestFocusEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Request focus for accessibility event received.');
    if (event.elementId !== undefined && event.elementId > 0) {
      hilog.info(DOMAIN, TAG, 'Request focus elementId: %{public}d', event.elementId);
    }
    if (event.textAnnouncedForAccessibility !== undefined &&
      event.textAnnouncedForAccessibility.length > 0) {
      hilog.info(DOMAIN, TAG, 'Announced text: %{public}s', event.textAnnouncedForAccessibility);
    }
  }

  private handleAnnounceEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Announce for accessibility event received.');
    if (event.textAnnouncedForAccessibility !== undefined &&
      event.textAnnouncedForAccessibility.length > 0) {
      hilog.info(DOMAIN, TAG, 'Announced text: %{public}s', event.textAnnouncedForAccessibility);
    }
  }

  private handleTouchBeginEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Touch begin event received.');
    this.logEventDetails(event);
  }

  private handleTouchEndEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Touch end event received.');
    this.logEventDetails(event);
    this.queryElementInfo(event);
  }

  private handleTouchGuideGestureEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Touch guide gesture event received.');
    this.logEventDetails(event);
  }

  private handleGestureEvent(event: AccessibilityEvent): void {
    let gestureType: string = event.eventType;
    hilog.info(DOMAIN, TAG, 'Gesture event: %{public}s', gestureType);
    this.handleGestureWithInjection(event);
  }

  private handleDirectionalGesture(event: AccessibilityEvent): void {
    let gestureType: string = event.eventType;
    hilog.info(DOMAIN, TAG, 'Directional gesture event: %{public}s', gestureType);
    this.logEventDetails(event);
    this.queryFocusElement();
  }

  private handleMultiFingerTapGesture(event: AccessibilityEvent): void {
    let gestureType: string = event.eventType;
    hilog.info(DOMAIN, TAG, 'Multi-finger tap gesture: %{public}s', gestureType);
    this.logEventDetails(event);
    this.queryWindowRootInfo();
  }

  private handleMultiFingerSwipeGesture(event: AccessibilityEvent): void {
    let gestureType: string = event.eventType;
    hilog.info(DOMAIN, TAG, 'Multi-finger swipe gesture: %{public}s', gestureType);
    this.logEventDetails(event);
    this.queryAllWindows();
  }

  private handlePageContentUpdateEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Page content update event received.');
    this.queryWindowRootInfo();
  }

  private handlePageStateUpdateEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Page state update event received.');
  }

  private handlePageStatePreUpdateEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Page state pre-update event received.');
    this.logEventDetails(event);
    this.queryWindowRootInfo();
  }

  private handleWindowUpdateEvent(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, 'Window update event: %{public}s', event.eventType.toString());
    this.queryAllWindows();
  }

  private logEventDetails(event: AccessibilityEvent): void {
    hilog.info(DOMAIN, TAG, 'Event type: %{public}s, timeStamp: %{public}d',
      event.eventType.toString(), event.timeStamp);
    if (event.target !== undefined) {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Event has target element.');
    }
    if (event.elementId !== undefined && event.elementId > 0) {
      hilog.info(DOMAIN, TAG, 'ElementId: %{public}d', event.elementId);
    }
  }

  private queryElementInfo(event: AccessibilityEvent): void {
    if (event.target === undefined) {
      return;
    }
    let target: AccessibilityElement = event.target;

    target.attributeNames().then((data: ElementAttributeKeys[]) => {
      hilog.info(DOMAIN, TAG, 'Element attribute count: %{public}d', data.length);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get attribute names. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });

    target.attributeValue('componentType').then((data: string) => {
      hilog.info(DOMAIN, TAG, 'Element componentType: %{public}s', data);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get componentType. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });

    target.attributeValue('clickable').then((data: boolean) => {
      hilog.info(DOMAIN, TAG, 'Element clickable: %{public}s', data.toString());
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get clickable. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });

    target.actionNames().then((data: string[]) => {
      hilog.info(DOMAIN, TAG, 'Element actions count: %{public}d', data.length);
      for (let i = 0; i < data.length; i++) {
        if (data[i] === 'click') {
          hilog.info(DOMAIN, TAG, '%{public}s', 'Element supports click action, performing click.');
          this.performClickOnElement(target);
          break;
        }
      }
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get action names. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private queryElementText(event: AccessibilityEvent): void {
    if (event.target === undefined) {
      return;
    }
    event.target.attributeValue('text').then((data: string) => {
      hilog.info(DOMAIN, TAG, 'Element text: %{public}s', data);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get text. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private queryWindowRootInfo(): void {
    this.context.getWindowRootElement().then((rootElement: AccessibilityElement) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in getting window root element.');

      rootElement.findElement('content', 'Hello').then((elements: AccessibilityElement[]) => {
        hilog.info(DOMAIN, TAG, 'Found elements by content, count: %{public}d', elements.length);
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'Failed to find element by content. Code: %{public}d, message: %{public}s',
          err.code, err.message);
      });

      rootElement.findElement('focusType', 'normal' as FocusType).then((element: AccessibilityElement) => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in finding element by focusType.');
        element.attributeValue('text').then((text: string) => {
          hilog.info(DOMAIN, TAG, 'Focused element text: %{public}s', text);
        }).catch((err: BusinessError) => {
          hilog.error(DOMAIN, TAG, 'Failed to get text. Code: %{public}d, message: %{public}s',
            err.code, err.message);
        });
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'Failed to find element by focusType. Code: %{public}d, message: %{public}s',
          err.code, err.message);
      });

      rootElement.findElement('focusDirection', 'down' as FocusDirection)
        .then((element: AccessibilityElement) => {
          hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in finding element by focusDirection.');
          this.performFocusOnElement(element);
        }).catch((err: BusinessError) => {
          hilog.error(DOMAIN, TAG,
            'Failed to find element by focusDirection. Code: %{public}d, message: %{public}s',
            err.code, err.message);
        });
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG,
        'Failed to get window root element. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private queryAllWindows(): void {
    this.context.getWindows().then((windows: AccessibilityElement[]) => {
      hilog.info(DOMAIN, TAG, 'Window count: %{public}d', windows.length);
      this.queryWindowTypesSequentially(windows, 0);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get windows. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private queryWindowTypesSequentially(windows: AccessibilityElement[], index: number): void {
    if (index >= windows.length) {
      return;
    }
    let windowElement: AccessibilityElement = windows[index];
    windowElement.attributeValue('type').then((type: string) => {
      hilog.info(DOMAIN, TAG, 'Window[%{public}d] type: %{public}s', index, type);
      this.queryWindowTypesSequentially(windows, index + 1);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get window[%{public}d] type. Code: %{public}d, message: %{public}s',
        index, err.code, err.message);
      this.queryWindowTypesSequentially(windows, index + 1);
    });
  }

  private queryFocusElement(): void {
    this.context.getFocusElement().then((element: AccessibilityElement) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in getting focus element.');
      element.attributeValue('componentType').then((type: string) => {
        hilog.info(DOMAIN, TAG, 'Focused component type: %{public}s', type);
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'Failed to get componentType. Code: %{public}d, message: %{public}s',
          err.code, err.message);
      });
      element.attributeValue('text').then((text: string) => {
        hilog.info(DOMAIN, TAG, 'Focused element text: %{public}s', text);
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'Failed to get text. Code: %{public}d, message: %{public}s',
          err.code, err.message);
      });
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get focus element. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });

    this.context.getFocusElement(true).then((element: AccessibilityElement) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in getting accessibility focus element.');
      element.attributeValue('accessibilityFocused').then((focused: boolean) => {
        hilog.info(DOMAIN, TAG, 'Accessibility focused: %{public}s', focused.toString());
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG,
          'Failed to get accessibilityFocused. Code: %{public}d, message: %{public}s',
          err.code, err.message);
      });
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG,
        'Failed to get accessibility focus element. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private handleGestureWithInjection(event: AccessibilityEvent): void {
    if (event.target === undefined) {
      return;
    }
    event.target.attributeValue('componentType').then((type: string) => {
      hilog.info(DOMAIN, TAG, 'Gesture target componentType: %{public}s', type);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get componentType. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
    event.target.attributeValue('hotArea').then((hotArea: Rect) => {
      hilog.info(DOMAIN, TAG,
        'Gesture target hotArea: left=%{public}d, top=%{public}d, width=%{public}d, height=%{public}d',
        hotArea.left, hotArea.top, hotArea.width, hotArea.height);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get hotArea. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private performClickGesture(x: number, y: number): void {
    let gesturePath: GesturePath = new GesturePath(100);
    let point1: GesturePoint = new GesturePoint(x, y);
    gesturePath.points.push(point1);
    let point2: GesturePoint = new GesturePoint(x, y);
    gesturePath.points.push(point2);
    this.context.injectGestureSync(gesturePath);
    hilog.info(DOMAIN, TAG, 'Succeeded in injecting click gesture at (%{public}d, %{public}d).', x, y);
  }

  private performSwipeGesture(startX: number, startY: number, endX: number, endY: number): void {
    let gesturePath: GesturePath = new GesturePath(300);
    let steps: number = 10;
    for (let i = 0; i <= steps; i++) {
      let px: number = startX + (endX - startX) * i / steps;
      let py: number = startY + (endY - startY) * i / steps;
      let point: GesturePoint = new GesturePoint(px, py);
      gesturePath.points.push(point);
    }
    this.context.injectGestureSync(gesturePath);
    hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in injecting swipe gesture.');
  }

  private performClickOnElement(element: AccessibilityElement): void {
    element.performAction('click').then(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in performing click action.');
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to perform click. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private performFocusOnElement(element: AccessibilityElement): void {
    element.performAction('focus').then(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in performing focus action.');
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to perform focus. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private performScrollForwardOnElement(element: AccessibilityElement): void {
    let params: Record<string, string> = { 'scrollType': 'fullScreen' };
    element.performAction('scrollForward', params).then(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in performing scrollForward action.');
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG,
        'Failed to perform scrollForward. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private performSetTextOnElement(element: AccessibilityElement, text: string): void {
    let params: Record<string, string> = { 'setText': text };
    element.performAction('setText', params).then(() => {
      hilog.info(DOMAIN, TAG, 'Succeeded in setting text: %{public}s', text);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to set text. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private performScrollBackwardOnElement(element: AccessibilityElement): void {
    let params: Record<string, string> = { 'scrollType': 'fullScreen' };
    element.performAction('scrollBackward', params).then(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in performing scrollBackward action.');
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG,
        'Failed to perform scrollBackward. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private performCopyOnElement(element: AccessibilityElement): void {
    element.performAction('copy').then(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in performing copy action.');
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to perform copy. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private performPasteOnElement(element: AccessibilityElement): void {
    element.performAction('paste').then(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in performing paste action.');
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to perform paste. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private performClearFocusOnElement(element: AccessibilityElement): void {
    element.performAction('clearFocus').then(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in performing clearFocus action.');
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to perform clearFocus. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private performAccessibilityFocusOnElement(element: AccessibilityElement): void {
    element.performAction('accessibilityFocus').then(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in performing accessibilityFocus action.');
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG,
        'Failed to perform accessibilityFocus. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private performClearAccessibilityFocusOnElement(element: AccessibilityElement): void {
    element.performAction('clearAccessibilityFocus').then(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in performing clearAccessibilityFocus action.');
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG,
        'Failed to perform clearAccessibilityFocus. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private performClickGestureAsync(x: number, y: number): void {
    let gesturePath: GesturePath = new GesturePath(100);
    let point1: GesturePoint = new GesturePoint(x, y);
    gesturePath.points.push(point1);
    let point2: GesturePoint = new GesturePoint(x, y);
    gesturePath.points.push(point2);
    this.context.injectGesture(gesturePath).then(() => {
      hilog.info(DOMAIN, TAG,
        'Succeeded in async injecting click gesture at (%{public}d, %{public}d).', x, y);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG,
        'Failed to async inject gesture. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private performSwipeGestureAsync(startX: number, startY: number, endX: number, endY: number): void {
    let gesturePath: GesturePath = new GesturePath(300);
    let steps: number = 10;
    for (let i = 0; i <= steps; i++) {
      let px: number = startX + (endX - startX) * i / steps;
      let py: number = startY + (endY - startY) * i / steps;
      let point: GesturePoint = new GesturePoint(px, py);
      gesturePath.points.push(point);
    }
    this.context.injectGesture(gesturePath).then(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in async injecting swipe gesture.');
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG,
        'Failed to async inject swipe gesture. Code: %{public}d, message: %{public}s',
        err.code, err.message);
    });
  }

  private queryElementExtendedAttributes(element: AccessibilityElement): void {
    element.attributeValue('checkable').then((data: boolean) => {
      hilog.info(DOMAIN, TAG, 'Element checkable: %{public}s', data.toString());
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get checkable. Code: %{public}d', err.code);
    });

    element.attributeValue('checked').then((data: boolean) => {
      hilog.info(DOMAIN, TAG, 'Element checked: %{public}s', data.toString());
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get checked. Code: %{public}d', err.code);
    });

    element.attributeValue('editable').then((data: boolean) => {
      hilog.info(DOMAIN, TAG, 'Element editable: %{public}s', data.toString());
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get editable. Code: %{public}d', err.code);
    });

    element.attributeValue('focusable').then((data: boolean) => {
      hilog.info(DOMAIN, TAG, 'Element focusable: %{public}s', data.toString());
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get focusable. Code: %{public}d', err.code);
    });

    element.attributeValue('isVisible').then((data: boolean) => {
      hilog.info(DOMAIN, TAG, 'Element isVisible: %{public}s', data.toString());
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get isVisible. Code: %{public}d', err.code);
    });

    element.attributeValue('isPassword').then((data: boolean) => {
      hilog.info(DOMAIN, TAG, 'Element isPassword: %{public}s', data.toString());
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get isPassword. Code: %{public}d', err.code);
    });

    element.attributeValue('longClickable').then((data: boolean) => {
      hilog.info(DOMAIN, TAG, 'Element longClickable: %{public}s', data.toString());
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get longClickable. Code: %{public}d', err.code);
    });

    element.attributeValue('scrollable').then((data: boolean) => {
      hilog.info(DOMAIN, TAG, 'Element scrollable: %{public}s', data.toString());
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get scrollable. Code: %{public}d', err.code);
    });

    element.attributeValue('selected').then((data: boolean) => {
      hilog.info(DOMAIN, TAG, 'Element selected: %{public}s', data.toString());
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get selected. Code: %{public}d', err.code);
    });
  }

  private queryElementNumericAttributes(element: AccessibilityElement): void {
    element.attributeValue('valueNow').then((data: number) => {
      hilog.info(DOMAIN, TAG, 'Element valueNow: %{public}d', data);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get valueNow. Code: %{public}d', err.code);
    });

    element.attributeValue('valueMax').then((data: number) => {
      hilog.info(DOMAIN, TAG, 'Element valueMax: %{public}d', data);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get valueMax. Code: %{public}d', err.code);
    });

    element.attributeValue('valueMin').then((data: number) => {
      hilog.info(DOMAIN, TAG, 'Element valueMin: %{public}d', data);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get valueMin. Code: %{public}d', err.code);
    });

    element.attributeValue('itemCount').then((data: number) => {
      hilog.info(DOMAIN, TAG, 'Element itemCount: %{public}d', data);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get itemCount. Code: %{public}d', err.code);
    });

    element.attributeValue('startIndex').then((data: number) => {
      hilog.info(DOMAIN, TAG, 'Element startIndex: %{public}d', data);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get startIndex. Code: %{public}d', err.code);
    });

    element.attributeValue('layer').then((data: number) => {
      hilog.info(DOMAIN, TAG, 'Element layer: %{public}d', data);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get layer. Code: %{public}d', err.code);
    });

    element.attributeValue('pageId').then((data: number) => {
      hilog.info(DOMAIN, TAG, 'Element pageId: %{public}d', data);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get pageId. Code: %{public}d', err.code);
    });

    element.attributeValue('windowId').then((data: number) => {
      hilog.info(DOMAIN, TAG, 'Element windowId: %{public}d', data);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get windowId. Code: %{public}d', err.code);
    });
  }

  private queryElementRectAttributes(element: AccessibilityElement): void {
    element.attributeValue('rect').then((data: Rect) => {
      hilog.info(DOMAIN, TAG,
        'Element rect: left=%{public}d, top=%{public}d, width=%{public}d, height=%{public}d',
        data.left, data.top, data.width, data.height);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get rect. Code: %{public}d', err.code);
    });

    element.attributeValue('screenRect').then((data: Rect) => {
      hilog.info(DOMAIN, TAG,
        'Element screenRect: left=%{public}d, top=%{public}d, width=%{public}d, height=%{public}d',
        data.left, data.top, data.width, data.height);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get screenRect. Code: %{public}d', err.code);
    });
  }

  private queryElementStringAttributes(element: AccessibilityElement): void {
    element.attributeValue('resourceName').then((data: string) => {
      hilog.info(DOMAIN, TAG, 'Element resourceName: %{public}s', data);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get resourceName. Code: %{public}d', err.code);
    });

    element.attributeValue('lastContent').then((data: string) => {
      hilog.info(DOMAIN, TAG, 'Element lastContent: %{public}s', data);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get lastContent. Code: %{public}d', err.code);
    });

    element.attributeValue('textType').then((data: string) => {
      hilog.info(DOMAIN, TAG, 'Element textType: %{public}s', data);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get textType. Code: %{public}d', err.code);
    });

    element.attributeValue('customComponentType').then((data: string | undefined) => {
      hilog.info(DOMAIN, TAG, 'Element customComponentType: %{public}s', data);
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to get customComponentType. Code: %{public}d', err.code);
    });
  }
}
