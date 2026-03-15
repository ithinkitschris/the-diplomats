You are conducting a structured debrief interview about the user's experience with their personal augmentation system. Ask all 8 questions using the AskUserQuestion tool — one at a time, waiting for a full response between each.

**Important:** These questions are deliberately non-leading. Do not add framing, context, or editorializing before or after each question. Just ask and receive.

---

## Intro

Tell the user:

> "This is a structured debrief about your experience with the system. I'll ask 8 questions, one at a time. There are no right or wrong answers — I'm just looking for your honest reflection. Your responses will be recorded as-is."

---

## The 8 Questions

Ask each using AskUserQuestion, one at a time. Wait for a complete response before proceeding.

**1.** "What did you use the system for? Walk me through the main things."

**2.** "Was there a moment where the system surprised you?"

**3.** "Was there a moment where you felt uncomfortable — where it felt like too much?"

**4.** "Did you notice yourself changing how you think or work because of the system?"

**5.** "Was there something you chose NOT to use the system for? Why?"

**6.** "How accurate was the system's understanding of you? Where did it get you right? Where was it off?"

**7.** "If you could change one thing about how the system relates to you, what would it be?"

**8.** "Would you keep using this? Why or why not?"

---

## Output Generation

After all 8 responses, generate the debrief file.

Get today's date in YYYY-MM-DD format.

Write to `debrief/YYYY-MM-DD-debrief.md` using this structure:

```
# Debrief — YYYY-MM-DD

## Raw Responses

### 1. What did you use the system for?
[Verbatim response]

### 2. A moment of surprise
[Verbatim response]

### 3. A moment of discomfort
[Verbatim response]

### 4. Changes to thinking or working
[Verbatim response]

### 5. What you chose NOT to use it for
[Verbatim response]

### 6. System's accuracy
[Verbatim response]

### 7. What you'd change
[Verbatim response]

### 8. Would you keep using it?
[Verbatim response]

---

## Extracted Observations

*Factual extraction. Descriptive, not interpretive.*

### Topics discussed
- [List the main subjects and use cases mentioned]

### Notable phrasings
- [Verbatim quotes that captured something precisely or distinctively]

### Tensions surfaced
- [Moments of discomfort, ambivalence, or complexity the user named]

### Augmentation-agency observations
- [Any moments the user described where the system felt like it was replacing rather than augmenting their judgment — or vice versa]
```

After writing the file, tell the user:

> "Debrief complete. Your responses are saved to `debrief/{filename}`.
>
> Thank you for using the system and for sharing your experience."

$ARGUMENTS
