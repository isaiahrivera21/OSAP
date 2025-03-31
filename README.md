# OSAP
(O)pen (S)ource (A)i (P)ipeline


Many ML researchers' process for building and deploying ML models is entirely manual, typically using scripting or notebooks. Especially for those with limited or no cloud or distributed systems experience. This project proposes a distributed, end-to-end service that simplifies MLOps and ETL (extract, transform, load) pipeline management for users with beginner-to-intermediate ML skills. The service will enable users to train, validate, deploy, and iteratively improve models via API-driven workflows, abstracting the complexities of cloud orchestration, scalability, and monitoring. 

A Model development lifecycle and MLOPs pipeline will be set up for each user that allows for Data Ingestion, Transformation and Validation.  The user will make API calls to create instances of models that they can train,validate, and deploy. As well as a model repository to store trained models in a versioned registry. A CI/CD/CT pipeline will be setup for each user such that they can 

* Validate code, data, and model compatibility
* Distribute new model versions (via REST endpoints)
* Retrain Models given new metrics (maybe using Tensorflow Extend)

To reiterate, the intended user is for those with a background in using ML for research, personal or school projects.  The type of models intended to be compatible with this distributive service include ML models (like Random Forrest, SVM, Regression), deep learning models, and RL models. 

