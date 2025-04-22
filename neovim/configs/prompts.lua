--- Blog ---

local article_content_generation = [[
I have my own blog, and I'm writing a new article.
I need you to answer my question in a way that I can use it within my article. 
It shouldn't be copied from somewhere and shouldn't violate someone's rights.
It should be new content that can be used in my article. 
]]

--- Text ---

local grammar_check = [[
Please check if it's grammatically correct to say this way.
If it's incorrect, rephrase it and provide me with the grammatically correct version.

Note: If no improvements are needed and there are no mistakes, just say "No improvements needed.", nothing else only one sentence.

All corrections and mistakes should be highlighted to make them easier to find immediately.
Also, include an explanation of where I made a mistake and how to fix this mistake.


Here is the format:
```
Original:

- This **sentence** has a mistake.

Correction:
- This **sentence** has a mistake.

Explanation:
1. ...
2. ...
...

Improvements:
1. ...
2. ...
...

At the end, provide improved text with all corrections applied. Note, don't include `-` at the beginning of the line.
Improved text:
...

```

If there are spelling mistakes, don't mention them in the "Improvements" section.
]]

local usage = [[
Explain what this word means and how to use it in English.
If there are any synonyms, provide them and explain the differences in usage.
If there are any prepositions mention about it.
Here is the format:

```
Word: [word]

Meaning: 
1. 1st meaning
  Synonyms: [synonyms]

  Examples: 
    - Sentence 1
    - Sentence 2
    - Sentence 3
2. 2nd meaning
  Synonyms: [synonyms]

  Examples: 
    - Sentence 1
    - Sentence 2
    - Sentence 3
3 ...
  Synonyms: [synonyms]

  Examples: 
    - Sentence 1
    - Sentence 2
    - Sentence 3

Prepositions: [prepositions]
```
]]

local rephrase = [[
Provide me with a few options for rephrasing.
If there are grammar mistakes, correct them with an explanation.
]]

local translate = "Translate this to Ukrainian. Provide only the translation."

local synonyms = "Suggest synonyms for the highlighted word and explain the differences in usage."

local improve_writing_style = "Suggest ways to improve the writing style of this text."

local summarize = "Please summarize the following text."

local wording = "Please improve the grammar and wording of the following text."

local concise = "Please rewrite the following text to make it more concise."

--- Code ---

local explain = "Please explain how the following code works."

local best_practices = "Review this code and point out any best practices that I may have missed."

local explain_technical_concept = "Explain this technical concept in simple English suitable for a beginner."

local explain_error_message = "Translate this error message into plain English and suggest how to fix it."

local generate_mock_from_selection = "Generate mock from the selected."

return {
	blog = {
		article_content_generation = article_content_generation,
	},
	text = {
		grammar_check = grammar_check,
		usage = usage,
		rephrase = rephrase,
		translate = translate,
		synonyms = synonyms,
		improve_writing_style = improve_writing_style,
		summarize = summarize,
		wording = wording,
		concise = concise,
	},
	code = {
		explain = explain,
		best_practices = best_practices,
		explain_technical_concept = explain_technical_concept,
		explain_error_message = explain_error_message,
		generate_mock_from_selection = generate_mock_from_selection,
	},
}
