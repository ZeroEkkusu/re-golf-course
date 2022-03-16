# Contributing

Gm, Ser,

Your contributions are most welcome.

Whether you are a caddie, golf pro, or world champ in the game of Solidity golf, does not matter.

With your help, we are collecting common Solidity optimization tips and myths in one place, open to anyone to learn from and expand upon.

The following guidelines will help you take your A-game to **⛳ Re:Golf Course**:

- optimizations should be as practical as possible

- explain why the optimization works and teach us a thing or two about the EVM

- names should be descriptive: no `foo = 4` and `i`; `four = 4` and `index` are better

- `Caddie` is for beginners

- `Golf Pro` is not recommended for beginners or is more advanced

- `World Champ` is for you to show off your golfing skills

- include tests: use [**🧪 Optimizooor's Lab**](https://github.com/ZeroEkkusu/optimizooors-lab) template; provide your `Samples.sol`, but rename it first

- alternatively, provide a single file with tests compatible with Foundry

- keep the repo looking cute:

``````text
### Write the title in the imperative

If the explanation is longer than one sentance, explain the technical stuff in the first paragraph. Don't forget to use backticks for code - e.g. `bytes`.

Talk about the gas numbers in the second paragraph.

**Note:** If there are any additonal notes, put them here.

Security considerations, if any, come last.

```solidity
SetupIfRelevant goesHere = new SetupIfRelevant();

// 🚩 Unoptimized
unoptimize("dCodeSnippet", goesHere);

// 🏌️ Optimized (-123 gas)
optimize("dCodeSnippet", goesHere);
```
``````