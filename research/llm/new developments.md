# New LLM Developments Since April 15, 2026

## Summary
This document captures the latest developments in Large Language Models published since the last research session (April 15, 2026). Key areas covered include historical context, transformer architecture evolution, Latent Attention/MoE techniques, and current top LLM leaderboards.

---

## Historical Context (Pre-Transformer Era)

### Evolution to Transformer Architecture

The development of Large Language Models represents a culmination of decades of research in natural language processing and deep learning. Key milestones leading to the Transformer architecture include:

- **Recurrent Neural Networks (RNNs)**: Early language models used RNNs to process sequences token by token, but suffered from vanishing gradient problems and difficulty with long-range dependencies.

- **Attention Mechanisms**: The breakthrough came with the introduction of attention mechanisms, which allowed models to weigh the importance of different parts of the input sequence when processing each token.

- **The Transformer (2017)**: The paper "Attention Is All You Need" introduced the Transformer architecture, which completely replaced recurrent layers with self-attention mechanisms. This enabled models to process entire sequences simultaneously, regardless of token distance.

Source: <https://en.wikipedia.org/wiki/Generative_pre-trained_transformer>

### Key Architectural Innovations

The Transformer architecture solved many performance issues associated with older RNN designs for NLP. The architecture's use of attention mechanisms allows models to consider all parts of the input simultaneously.

Source: <https://en.wikipedia.org/wiki/Generative_pre-trained_transformer>

---

## Transformer Architecture Evolution (2024-2026)

### Key Architectural Trends

Recent LLMs have evolved significantly from the original Transformer design, with several key innovations:

1. **Rotary Position Embeddings (RoPE)**: Replaced absolute positional embeddings with relative positional encodings that scale better to long contexts.

2. **Grouped-Query Attention (GQA)**: Reduces memory usage for KV cache by sharing key-value heads across multiple query heads.

3. **Sliding-Window Attention**: Limits attention to local windows for long-context efficiency, mixed with occasional global attention layers.

4. **Mixture of Experts (MoE)**: Activates only a subset of model parameters per token, dramatically reducing inference costs while maintaining large model capacity.

Source: <https://sebastianraschka.com/llm-architecture-gallery/>

### Recent Architecture Milestones

#### DeepSeek V3 (December 2024)
- 671B total parameters, with only 37B active per token (5.5% sparse activation)
- Multi-head Latent Attention (MLA) for reduced KV cache size
- 128K token context window
- Trained with mixed-precision arithmetic (8-bit floating point for forward pass)
- Training cost: ~$5.6M (vs $100M for GPT-4)

Source: <https://en.wikipedia.org/wiki/DeepSeek>

#### GLM-4.5 / GLM-5 (February-March 2026)
- GLM-4.5: 355B total parameters with 32B active (9% sparse MoE)
- GLM-5: 744B total parameters with 40B active (5.4% sparse MoE)
- Uses MLA with DeepSeek Sparse Attention
- Native multimodal capabilities
- 202K+ token context window

Source: <https://sebastianraschka.com/llm-architecture-gallery/>

#### Mistral Large 3 (December 2025)
- 673B total parameters, with 41B active (6.1% sparse activation)
- Near-clone of DeepSeek V3 architecture with MLA attention
- 262K token context window
- Multimodal support

Source: <https://sebastianraschka.com/llm-architecture-gallery/>

#### Qwen3 Series (April 2026)
- Qwen3-32B: 32B dense model with GQA and QK-Norm
- Qwen3-Next: 80B MoE with DeltaNet-attention hybrid
- Qwen3-5: 397B MoE with 17B active (4.3%)
- Uses alternating sliding-window and full attention layers

Source: <https://sebastianraschka.com/llm-architecture-gallery/>

---

## Latent Attention and Mixture of Experts (MoE)

### Multi-Head Latent Attention (MLA)

MLA is a low-rank approximation of the standard attention mechanism developed by DeepSeek. Key features:

- Uses compressed latent vectors to reduce KV cache size
- Significantly reduces memory usage during inference
- Enables longer context windows with the same memory footprint
- Adopted by multiple model families (DeepSeek, GLM, Mistral)

The mechanism works through queries, keys, and values where the information to be communicated is processed through compressed latent representations. The mathematical formulation—Attention(Q, K, V) = softmax(QKᵀ/√d)V—efficiently computes weighted relationships between all sequence elements.

Source: <https://en.wikipedia.org/wiki/DeepSeek>
Source: <https://tensorgym.com/blog/transformer-attention>

### Mixture of Experts Architecture

MoE models activate only a subset of parameters per token, dramatically improving efficiency:

- **Sparse Activation**: Only 3-10% of total parameters are active per forward pass
- **Shared Experts**: Always activated to handle common patterns
- **Routed Experts**: Selected dynamically based on input
- **Cost Reduction**: Inference cost matches a much smaller dense model

DeepSeek's V3 uses 256 routed experts plus 1 shared expert, with only 37B active of 671B total parameters.

Source: <https://en.wikipedia.org/wiki/DeepSeek>
Source: <https://blog.easecloud.io/ai-cloud/qwen-vs-deepseek-vs-glm/>

### Efficiency Improvements

Recent models have achieved remarkable efficiency gains:

- **DeepSeek V3**: Trained for $6M (vs $100M for GPT-4) using approximately 1/10th the computing power of comparable models
- **MoE Routing**: Reduces inference costs by 3-5x compared to dense models of similar capability
- **Mixed Precision**: Uses 8-bit floating point for forward pass, 16-bit for optimizer states
- **Sparse Attention**: Reduces memory bandwidth requirements for long contexts

Source: <https://en.wikipedia.org/wiki/DeepSeek>

---

## Top LLM Leaderboards (April 2026)

### Overall Performance Leaderboard

| Rank | Model | Provider | Type | Key Features |
|------|-------|----------|------|--------------|
| 1 | GPT-5.2 (xhigh) | OpenAI | Proprietary | Leading overall, 50.58% quality score |
| 2 | Claude Opus 4.5 (Reasoning) | Anthropic | Proprietary | Best multi-file understanding |
| 3 | Gemini 3 Pro Preview (high) | Google | Proprietary | Strong in reasoning tasks |
| 4 | GLM-4.7 (Reasoning) | Z AI | Open | Best open-weight coding model |
| 5 | DeepSeek V3.2 | DeepSeek | Open | Best value API at $0.35/M tokens |

Source: <https://whatllm.org/best-llm-for-coding>
Source: <https://llm-stats.com/llm-updates>

### Coding Leaderboard

| Rank | Model | Quality Score | LiveCodeBench | Terminal-Bench | SciCode | License |
|------|-------|---------------|---------------|----------------|---------|---------|
| 1 | GPT-5.2 (xhigh) | 50.58% | 89% | 44% | 52% | Proprietary |
| 2 | Claude Opus 4.5 (Reasoning) | 49.18% | - | 50% | - | Proprietary |
| 3 | Gemini 3 Pro Preview (high) | 47.99% | 92% | 39% | 56% | Proprietary |
| 4 | GLM-4.7 (Reasoning) | 41.7% | 89% | - | 45% | Open |
| 5 | DeepSeek V3.2 | - | - | - | - | Open |

Source: <https://whatllm.org/best-llm-for-coding>

### Chinese Language Models

| Model | C-Eval (Chinese) | MMLU (General) | HumanEval (Code) | License |
|-------|------------------|----------------|------------------|---------|
| GLM-4 32B | 87.2% | 81.0% | 67.3% | Custom (SOE-approved) |
| Qwen 2.5 72B | 86.8% | 86.5% | 74.2% | Apache 2.0 |
| DeepSeek V3 | 85.9% | 88.5% | 78.6% | MIT |

Source: <https://blog.easecloud.io/ai-cloud/qwen-vs-deepseek-vs-glm/>

### Key Observations

1. **Open-Weight Models Closing Gap**: Models like GLM-4.7 and DeepSeek V3.2 are matching or exceeding proprietary models on specific benchmarks.

2. **Cost Efficiency**: DeepSeek V3.2 provides 90%+ quality at $0.35/M tokens—1/10th the cost of proprietary APIs.

3. **Chinese Models Dominating Chinese Tasks**: Chinese-language models outperform Western alternatives by 10-15% on Chinese benchmarks.

4. **MoE Architecture Dominance**: Most frontier models now use sparse MoE architectures for efficiency.

Source: <https://llm-stats.com/llm-updates>
Source: <https://blog.easecloud.io/ai-cloud/qwen-vs-deepseek-vs-glm/>

---

## Recent Model Releases (April 2026)

### Notable Updates

1. **GLM-4.7 Thinking (April 2026)**
   - Top open-weight coding model in 2026
   - Free to self-host
   - Available on Ollama and HuggingFace
   - Achieves competitive performance with proprietary models

2. **DeepSeek V3.2 (March 2026)**
   - MODEL1 architecture with tiered KV cache system
   - 40% memory reduction and 1.8x inference speedup via Sparse FP8 decoding
   - Released March 3, 2026

3. **Qwen3-Max-Thinking (January 2026)**
   - Released January 2026 as reasoning model
   - Performance comparable to GPT-5.2-Thinking, Claude-Opus-4.5, and Gemini 3 Pro

Source: <https://whatllm.org/best-llm-for-coding>
Source: <https://tech-insider.org/chatgpt-vs-claude-vs-deepseek-vs-gemini-2026/>
Source: <https://zhuanlan.zhihu.com/p/670574382>

---

## Benchmarks and Evaluations

### Key Benchmark Categories

| Benchmark | Focus | Key Models |
|-----------|-------|------------|
| MMLU | Multitask understanding (57 subjects) | GLM-4 32B (81%), DeepSeek V3 (88.5%) |
| C-Eval | Chinese language understanding | GLM-4 32B (87.2%) |
| HumanEval | Code generation | DeepSeek V3 (78.6%) |
| GSM8K | Math reasoning | DeepSeek V3 (89.4%) |
| SWE-Bench Verified | Real-world coding issues | Claude Mythos Preview (93.9%) |
| LiveCodeBench | Holistic code evaluation | GPT-5.2 (89%) |

Source: <https://llm-stats.com/ai-news>
Source: <https://blog.easecloud.io/ai-cloud/qwen-vs-deepseek-vs-glm/>

---

## Future Directions

### Emerging Trends

1. **Hybrid Architectures**: Combining attention with state-space models (Mamba) for efficiency
2. **Latent Experts**: Adding expert-like components within attention mechanisms
3. **Speculative Decoding**: Using smaller models to predict multiple tokens simultaneously
4. **Long Context Optimization**: 256K+ token contexts with efficient attention mechanisms

### Research Focus Areas

- Improving MoE routing efficiency
- Reducing activation costs for sparse models
- Optimizing mixed-precision training
- Developing more efficient attention mechanisms for long contexts

Source: <https://sebastianraschka.com/llm-architecture-gallery/>

---

## Sources

1. Sebastian Raschka's LLM Architecture Gallery: <https://sebastianraschka.com/llm-architecture-gallery/>
2. DeepSeek Wikipedia: <https://en.wikipedia.org/wiki/DeepSeek>
3. WhatLLM Coding Leaderboard: <https://whatllm.org/best-llm-for-coding>
4. LLM Stats Updates: <https://llm-stats.com/llm-updates>
5. EaseCloud Chinese Model Comparison: <https://blog.easecloud.io/ai-cloud/qwen-vs-deepseek-vs-glm/>
6. Transformer Architecture Explained: <https://tensorgym.com/blog/transformer-attention>
7. Wikipedia - Large Language Models: <https://en.wikipedia.org/wiki/Large_language_model>
8. IBM Research - Transformer Explainer: <https://research.ibm.com/publications/transformer-explainer-learning-llm-transformers-with-interactive-visual-explanation-and-experimentation>

---

*Last Updated: April 15, 2026*
*Research Session: Daily LLM Research*
