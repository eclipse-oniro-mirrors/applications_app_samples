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

import { Configuration, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { formBindingData, FormExtensionAbility, formInfo, formProvider } from '@kit.FormKit';
import Logger from '../util/Logger';
import { FormEventService } from '../feature/FormEventService';
import { FormPublishCounter } from '../feature/FormPublishCounter';

const FORM_PAGE: string = 'EntryFormAbility';

/**
 * Refreshes the service widget, replaced by tests to avoid the widget host.
 */
export interface FormUpdater {
    updateForm(formId: string, data: formBindingData.FormBindingData): Promise<void>;
}

class SystemFormUpdater implements FormUpdater {
    updateForm(formId: string, data: formBindingData.FormBindingData): Promise<void> {
        return formProvider.updateForm(formId, data);
    }
}

const SYSTEM_FORM_UPDATER: FormUpdater = new SystemFormUpdater();

/**
 * Service widget provider that publishes the custom common event when the widget is clicked.
 */
export default class EntryFormAbility extends FormExtensionAbility {
    private counter: FormPublishCounter = new FormPublishCounter();
    private updater: FormUpdater = SYSTEM_FORM_UPDATER;

    /**
     * Replaces the widget refresh implementation.
     *
     * @param updater Destination of the binding data updates.
     */
    setFormUpdater(updater: FormUpdater): void {
        this.updater = updater;
    }

    /**
     * Returns the initial binding data of the widget.
     *
     * @param want Want that starts the widget provider.
     * @returns Binding data rendered by the widget.
     */
    onAddForm(want: Want): formBindingData.FormBindingData {
        Logger.event(FORM_PAGE, 'onAddForm');
        return FormEventService.createBindingData(0);
    }

    /**
     * Called when a temporary widget is converted to a normal one.
     *
     * @param formId Identity of the widget.
     */
    onCastToNormalForm(formId: string): void {
        Logger.event(FORM_PAGE, 'onCastToNormalForm', `formId: ${formId}`);
    }

    /**
     * Refreshes the widget with the publish count kept by the provider.
     *
     * @param formId Identity of the widget.
     * @param wantParams Update parameters sent by the widget host.
     */
    onUpdateForm(formId: string, wantParams?: Record<string, Object>): void {
        Logger.event(FORM_PAGE, 'onUpdateForm', `formId: ${formId}`);
        this.refreshForm(formId);
    }

    /**
     * Called when the visibility of the widget changes.
     *
     * @param newStatus Visibility of every widget of this provider.
     */
    onChangeFormVisibility(newStatus: Record<string, number>): void {
        Logger.event(FORM_PAGE, 'onChangeFormVisibility', `count: ${Object.keys(newStatus).length}`);
    }

    /**
     * Publishes the custom common event and refreshes the widget count.
     *
     * @param formId Identity of the widget.
     * @param message Message delivered by the click action of the widget.
     */
    onFormEvent(formId: string, message: string): void {
        Logger.event(FORM_PAGE, 'onFormEvent', `formId: ${formId}, message: ${message}`);
        FormEventService.publishFromForm(message).then(() => {
            this.counter.increment(formId);
            this.refreshForm(formId);
        }).catch((error: Error) => {
            Logger.error(`Failed to publish the widget event: ${error.message}`);
        });
    }

    /**
     * Releases the publish count kept for the removed widget.
     *
     * @param formId Identity of the widget.
     */
    onRemoveForm(formId: string): void {
        Logger.event(FORM_PAGE, 'onRemoveForm', `formId: ${formId}`);
        this.counter.remove(formId);
    }

    /**
     * Called when the widget host queries the form state.
     *
     * @param want Want that starts the widget provider.
     * @returns Ready so that the widget can be added at any time.
     */
    onAcquireFormState(want: Want): formInfo.FormState {
        return formInfo.FormState.READY;
    }

    /**
     * Called when the system configuration changes.
     *
     * @param newConfig Updated configuration.
     */
    onConfigurationUpdate(newConfig: Configuration): void {
        Logger.event(FORM_PAGE, 'onConfigurationUpdate', `language: ${newConfig.language ?? ''}`);
    }

    /**
     * @param formId Identity of the widget.
     * @returns Number of events published by the widget.
     */
    getPublishCount(formId: string): number {
        return this.counter.get(formId);
    }

    private refreshForm(formId: string): void {
        this.updater.updateForm(formId, FormEventService.createBindingData(this.counter.get(formId)))
            .catch((error: BusinessError) => {
                Logger.error(`Failed to update the widget ${formId}, code: ${error.code}`);
            });
    }
}