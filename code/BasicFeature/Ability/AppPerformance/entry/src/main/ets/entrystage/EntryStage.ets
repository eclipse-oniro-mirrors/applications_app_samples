import { AbilityStage } from '@kit.AbilityKit';
import { beginLaunchEvidence } from '../core/LaunchEvidence';

export default class EntryStage extends AbilityStage {
  onCreate(): void {
    beginLaunchEvidence('AbilityStage.onCreate');
  }

  onLaunchFromHyperSnap(): void {
    // The system invokes this callback only when the process launches from HyperSnap.
    // Generate a new ID here: an ID captured in a snapshot is not a new launch.
    beginLaunchEvidence('AbilityStage.onLaunchFromHyperSnap');
  }
}
