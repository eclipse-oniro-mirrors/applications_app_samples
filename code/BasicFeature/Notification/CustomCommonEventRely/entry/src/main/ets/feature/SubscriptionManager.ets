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

import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import Logger from '../util/Logger';
import { CommonEventConstants } from '../util/Constants';

/**
 * Creates the common event subscriber, replaced by tests to avoid the framework.
 */
export interface SubscriberFactory {
    create(events: string[]): Promise<commonEventManager.CommonEventSubscriber>;
}

class SystemSubscriberFactory implements SubscriberFactory {
    create(events: string[]): Promise<commonEventManager.CommonEventSubscriber> {
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = { events: events };
        return commonEventManager.createSubscriber(subscribeInfo);
    }
}

/**
 * Keeps the subscription of the custom common event shown by the home page.
 */
export class SubscriptionManager {
    private static readonly SYSTEM_FACTORY: SubscriberFactory = new SystemSubscriberFactory();

    private factory: SubscriberFactory;
    private listener: (error: BusinessError, event: commonEventManager.CommonEventData) => void;
    private subscriber: commonEventManager.CommonEventSubscriber | null = null;
    private subscribed: boolean = false;

    /**
     * @param listener Callback invoked for every received event.
     * @param factory Creates the subscriber, defaults to the common event framework.
     */
    constructor(listener: (error: BusinessError, event: commonEventManager.CommonEventData) => void,
        factory: SubscriberFactory = SubscriptionManager.SYSTEM_FACTORY) {
        this.listener = listener;
        this.factory = factory;
    }

    isSubscribed(): boolean {
        return this.subscribed;
    }

    /**
     * Establishes the subscription, ignored while the subscription is active.
     *
     * @returns True when the subscription has been established by this call.
     */
    start(): Promise<boolean> {
        if (this.subscribed) {
            return Promise.resolve(false);
        }
        return this.factory.create([CommonEventConstants.EVENT_NAME])
            .then((subscriber: commonEventManager.CommonEventSubscriber) => {
                this.subscriber = subscriber;
                commonEventManager.subscribe(subscriber, this.listener);
                this.subscribed = true;
                Logger.info('Succeeded in subscribing to the custom common event.');
                return true;
            })
            .catch((error: BusinessError) => {
                this.subscribed = false;
                Logger.error(`Failed to subscribe to the custom common event, code: ${error.code}`);
                return false;
            });
    }

    /**
     * Releases the subscription, ignored when the subscription is not active.
     *
     * @returns True when the subscription has been released by this call.
     */
    stop(): Promise<boolean> {
        let currentSubscriber: commonEventManager.CommonEventSubscriber | null = this.subscriber;
        if (currentSubscriber === null) {
            return Promise.resolve(false);
        }
        this.subscriber = null;
        this.subscribed = false;
        return new Promise<boolean>((resolve: (value: boolean) => void) => {
            commonEventManager.unsubscribe(currentSubscriber, (error: BusinessError) => {
                if (error && error.code !== 0) {
                    Logger.error(`Failed to unsubscribe from the custom common event, code: ${error.code}`);
                    resolve(false);
                    return;
                }
                Logger.info('Succeeded in unsubscribing from the custom common event.');
                resolve(true);
            });
        });
    }
}
