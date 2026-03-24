# PRD Draft: Project "Aura-Link" (Emergent NPC Social Dynamics)

## Research Hypothesis

By utilizing a Dynamic Personality Vector ($P_v$), an NPC can demonstrate "emergent behavior"—developing unique social traits (e.g., trust, hostility, or obsession) that were not explicitly programmed, but evolved through the "Fluid" interaction with a player.

## Core Conceptual Pillars

### The Personality Matrix

- Trait Mapping: Use a simplified version of the OCEAN (Big Five) model to define the NPC’s baseline.
- Fluidity Engine: The $P_v$ should not be static. Every interaction (dialogue sentiment, gift-giving, or combat proximity) should apply a "force" to the vector, causing it to shift over time.

### Memory & Impression Layer

- Short-term Memory: High-resolution logs of the last 10 interactions.
- Long-term Impression: A "weighted summary" that influences the NPC's default mood when the player enters their proximity.

### Behavioral Output (The "Aura")

- Instead of changing dialogue lines only, the NPC's behavioral set should change.
- Example: If an NPC becomes "Fearful," their pathfinding should prioritize maintaining a specific distance from the player, and their idle animations should shift to "Anxious" states.

## Preliminary Requirements

- Input: A stream of "Interaction Events" (Type, Sentiment Score, Duration).
- Processing: An AI-driven "Evolution Logic" that determines how much the Personality Vector should shift after each event.
- Output: A real-time update to the NPC’s state machine and dialogue style.

## Research Goals for Testing

- Consistency vs. Change: How do we ensure the NPC doesn't become "schizophrenic" (changing too fast) while still feeling reactive?
- Sentiment Decay: How does time affect the memory? Does the NPC "forgive" the player for a negative interaction after a certain period of positive ones?
- Recursive Feedback: If the NPC becomes hostile, and the player reacts to that hostility, does the system create an unbreakable "Hate Loop"?
